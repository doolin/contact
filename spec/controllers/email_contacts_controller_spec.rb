# frozen_string_literal: true

require 'spec_helper'

describe EmailContactsController do
  include Devise::Test::ControllerHelpers

  render_views

  def mock_email_contact(stubs={})
    (@mock_email_contact ||= mock_model(EmailContact).as_null_object).tap do |email_contact|
      stubs.each do |k, v|
        allow(email_contact).to receive(k).and_return(v)
      end
    end
  end

  context 'when not signed in' do
    describe 'GET index' do
      it 'redirects to root' do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'GET show' do
      it 'redirects to root' do
        get :show, params: { id: '1' }
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'GET new' do
      it 'responds successfully for unauthenticated users' do
        get :new
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'POST create' do
      it 'allows unauthenticated users to create contacts' do
        allow_any_instance_of(EmailContactsController).to receive(:deliver)
        attrs = {
          name: 'visitor',
          email: 'visitor@example.com',
          subject: 'hello',
          message: 'a message from a visitor'
        }
        expect do
          post :create, params: { email_contact: attrs }
        end.to change(EmailContact, :count).by(1)
      end
    end
  end

  context 'when signed in as admin' do
    before(:each) do
      @admin = Admin.create(email: 'admin@test.com', password: 'foobarski')
      sign_in(@admin, scope: :admin)
    end

    describe 'GET thankyou' do
      it 'displays Thanks in the response' do
        get :thankyou
        expect(response.body).to have_selector('p', text: 'Thanks')
      end

      it 'assigns @thanks' do
        get :thankyou
        expect(assigns(:thanks)).to eq('Come back soon!')
      end
    end

    describe 'GET index' do
      it 'responds successfully for admin' do
        get :index
        expect(response).to have_http_status(:ok)
      end

      it 'assigns all email_contacts as @email_contacts' do
        contact = EmailContact.create!(
          name: 'Test', email: 'test@test.com',
          subject: 'Test', message: 'Test message'
        )
        get :index
        expect(assigns(:email_contacts)).to eq([contact])
      end
    end

    describe 'GET show' do
      it 'assigns the requested email_contact as @email_contact' do
        contact = EmailContact.create!(
          name: 'Test', email: 'test@test.com',
          subject: 'Test', message: 'Test message'
        )
        get :show, params: { id: contact.id }
        expect(response).to have_http_status(:ok)
        expect(assigns(:email_contact)).to eq(contact)
      end
    end

    describe 'GET new' do
      it 'assigns a new email_contact as @email_contact' do
        get :new
        expect(response).to have_http_status(:ok)
        expect(assigns(:email_contact)).to be_a_new(EmailContact)
      end
    end

    describe 'GET edit' do
      it 'redirects to email_contacts index' do
        get :edit, params: { id: '37' }
        expect(response).to redirect_to(email_contacts_url)
      end
    end

    describe '.create' do
      context 'with valid params' do
        it 'creates EmailContact and redirects to Thank You' do
          allow(controller).to receive(:deliver)

          attrs = {
            name: 'verena',
            email: 'v@virga.com',
            subject: 'slipstream',
            message: 'the pilot is not your friend'
          }
          expect do
            post :create, params: { email_contact: attrs }
          end.to change(EmailContact, :count).by(1)
          expect(response).to redirect_to(thankyou_path)
        end

        it 'calls deliver on successful save' do
          expect(controller).to receive(:deliver).once
          attrs = {
            name: 'verena',
            email: 'v@virga.com',
            subject: 'slipstream',
            message: 'the pilot is not your friend'
          }
          post :create, params: { email_contact: attrs }
        end
      end

      context 'with invalid params' do
        let(:attrs) { { bogus: :data } }

        it 'does not create an email_contact' do
          expect do
            post :create, params: { email_contact: attrs }
          end.to change(EmailContact, :count).by(0)
        end

        it 'responds with :ok and re-renders new' do
          post :create, params: { email_contact: attrs }
          expect(response).to have_http_status(:ok)
        end
      end
    end

    describe '.update' do
      let(:attrs) { { 'email': 'v@virga.com' } }

      context 'with valid params' do
        it 'updates the requested email_contact' do
          allow(EmailContact).to receive(:find) { mock_email_contact }
          allow(mock_email_contact).to receive(:to_str).and_return('foo')
          put :update, params: { id: mock_email_contact.id, email_contact: attrs }
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to(email_contact_path(mock_email_contact))
        end

        it 'redirects to the email_contact' do
          allow(EmailContact).to receive(:find) { mock_email_contact(update_attributes: true) }
          allow(mock_email_contact).to receive(:to_str).and_return('foo')
          put :update, params: { id: mock_email_contact.id, email_contact: attrs }
          expect(response).to redirect_to(email_contact_url(mock_email_contact))
        end
      end

      context 'with invalid params' do
        it 'responds with 200' do
          allow(EmailContact).to receive(:find) { mock_email_contact(update_attributes: false) }
          put :update, params: { id: mock_email_contact.id, email_contact: attrs }
          expect(response).to have_http_status(200)
        end
      end
    end

    describe '#destroy' do
      it 'destroys the requested email_contact' do
        allow(EmailContact).to receive(:find).with('37') { mock_email_contact }
        expect(mock_email_contact).to receive(:destroy)
        delete :destroy, params: { id: '37' }
      end

      it 'redirects to the email_contacts list' do
        allow(EmailContact).to receive(:find).with('37') { mock_email_contact }
        delete :destroy, params: { id: '37' }
        expect(response).to redirect_to(email_contacts_url)
      end
    end
  end
end

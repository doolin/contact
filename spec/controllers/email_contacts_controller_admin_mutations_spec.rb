# frozen_string_literal: true

require 'spec_helper'

describe EmailContactsController do
  include Devise::Test::ControllerHelpers

  let(:valid_attrs) do
    {
      name: 'verena',
      email: 'v@virga.com',
      subject: 'slipstream',
      message: 'the pilot is not your friend'
    }
  end

  before do
    admin = Admin.create(email: 'admin@test.com', password: 'foobarski')
    sign_in(admin, scope: :admin)
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates EmailContact and redirects to Thank You' do
        allow(controller).to receive(:deliver)
        expect do
          post :create, params: { email_contact: valid_attrs }
        end.to change(EmailContact, :count).by(1)
        expect(response).to redirect_to(thankyou_path)
      end

      it 'calls deliver on successful save' do
        expect(controller).to receive(:deliver).once
        post :create, params: { email_contact: valid_attrs }
      end

      it 'creates EmailContact and renders xml with created status' do
        allow(controller).to receive(:deliver)
        post :create, params: { email_contact: valid_attrs }, format: :xml
        expect(response).to have_http_status(:created)
        expect(response.content_type).to include('application/xml')
      end
    end

    context 'with invalid params' do
      it 'does not create an email_contact' do
        expect do
          post :create, params: { email_contact: { name: '', email: '', subject: '', message: '' } }
        end.to change(EmailContact, :count).by(0)
      end

      it 'responds with :ok and re-renders new' do
        post :create, params: { email_contact: { name: '', email: '', subject: '', message: '' } }
        expect(response).to have_http_status(:ok)
      end

      it 'returns unprocessable_entity in xml format' do
        post :create,
             params: { email_contact: { name: '', email: '', subject: '', message: '' } },
             format: :xml
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to include('application/xml')
      end
    end
  end

  describe 'PUT #update' do
    let(:contact) { EmailContact.create!(valid_attrs) }

    context 'with valid params' do
      it 'updates and redirects to the email_contact' do
        put :update, params: { id: contact.id, email_contact: { email: 'new@email.com' } }
        expect(response).to redirect_to(email_contact_path(contact))
      end

      it 'returns ok for xml requests' do
        put :update, params: { id: contact.id, email_contact: { email: 'new@email.com' } }, format: :xml
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq('')
      end
    end

    context 'with invalid params' do
      it 'responds with 200' do
        put :update, params: { id: contact.id, email_contact: { email: '' } }
        expect(response).to have_http_status(200)
      end

      it 'returns unprocessable_entity in xml format' do
        put :update, params: { id: contact.id, email_contact: { email: '' } }, format: :xml
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to include('application/xml')
      end
    end
  end

  describe '#destroy' do
    it 'destroys the requested email_contact and redirects' do
      contact = EmailContact.create!(valid_attrs)
      expect do
        delete :destroy, params: { id: contact.id }
      end.to change(EmailContact, :count).by(-1)
      expect(response).to redirect_to(email_contacts_url)
    end

    it 'returns ok for xml requests' do
      contact = EmailContact.create!(valid_attrs)
      delete :destroy, params: { id: contact.id }, format: :xml
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('')
    end
  end
end

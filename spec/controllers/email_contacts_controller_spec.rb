# frozen_string_literal: true

require 'spec_helper'

describe EmailContactsController do
  # See:
  # https://github.com/plataformatec/devise
  # http://rdoc.info/github/plataformatec/devise/master/Devise/TestHelpers
  # The TestHelpers create sign_in/sign_out capability.
  include Devise::Test::ControllerHelpers

  render_views

  before(:each) do
    @admin = Admin.create(password: '13')
    sign_in(@admin, scope: :admin)
  end

  def mock_email_contact(stubs={})
    (@mock_email_contact ||= mock_model(EmailContact).as_null_object).tap do |email_contact|
      stubs.each do |k, v|
        allow(email_contact).to receive(k).and_return(v)
      end
      # email_contact.stub(stubs) unless stubs.empty?
    end
  end

  # This is really a view spec, adding the message to the thankyou
  # page would be tested here.
  describe 'GET thankyou' do
    it 'displays Thanks in the response' do
      get :thankyou
      expect(response.body).to have_selector('p', text: 'Thanks')
    end
  end

  describe 'GET index' do
    it 'assigns all email_contacts as @email_contacts' do
      # EmailContact.stub(:all) { mock_email_contact }
      get :index
      expect(response).to have_http_status(:found)
      # assigns(:email_contacts).should eq(@mock_email_contact)
    end
  end

  describe 'GET show' do
    it 'assigns the requested email_contact as @email_contact' do
      # EmailContact.stub(:find).with('37') { mock_email_contact }
      get :show, params: { id: '37' }
      # assigns(:email_contact).should be(mock_email_contact)
      expect(response).to have_http_status(:found)
      # assigns(:email_contact).should == @mock_email_contact
    end
  end

  describe 'GET new' do
    it 'assigns a new email_contact as @email_contact' do
      # EmailContact.stub(:new) { mock_email_contact }
      get :new
      expect(response).to have_http_status(:ok)
      # assigns(:email_contact).should be(@mock_email_contact)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested email_contact as @email_contact' do
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

      xit 'redirects to the created email_contact' do
        EmailContact.stub(:new) { mock_email_contact(save: true) }
        allow(controller).to receive(:deliver)
        post :create, email_contact: {}
        # response.should redirect_to(email_contact_url(mock_email_contact))
        response.should redirect_to(thankyou_path)
      end
    end

    context 'with invalid params' do
      let(:attrs) { { bogus: :data } }

      it 'assigns a newly created but unsaved email_contact as @email_contact' do
        expect do
          post :create, params: { email_contact: attrs }
        end.to change(EmailContact, :count).by(0)
      end

      it 'responds with :ok' do
        post :create, params: { email_contact: attrs }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe '.update' do
    let(:attrs) { { 'email': 'v@virga.com' } }

    context 'with valid params' do
      it 'updates the requested email_contact' do
        # EmailContact.should_receive(:find) { mock_email_contact }
        allow(EmailContact).to receive(:find) { mock_email_contact }
        allow(mock_email_contact).to receive(:to_str).and_return('foo')
        put :update, params: { id: mock_email_contact.id, email_contact: attrs }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(email_contact_path(mock_email_contact))
      end

      xit 'assigns the requested email_contact as @email_contact' do
        # EmailContact.stub(:find) { mock_email_contact(update_attributes: true) }
        allow(EmailContact).to receive(:find) { mock_email_contact(update_attributes: true) }
        allow(mock_email_contact).to receive(:to_str).and_return('foo')
        put :update, params: { id: mock_email_contact.id, email_contact: attrs }
        # assigns(:email_contact).should be(mock_email_contact)
      end

      it 'redirects to the email_contact' do
        # EmailContact.stub(:find) { mock_email_contact(update_attributes: true) }
        allow(EmailContact).to receive(:find) { mock_email_contact(update_attributes: true) }
        allow(mock_email_contact).to receive(:to_str).and_return('foo')
        put :update, params: { id: mock_email_contact.id, email_contact: attrs }
        expect(response).to redirect_to(email_contact_url(mock_email_contact))
      end
    end

    context 'with invalid params' do
      it 'assigns the email_contact as @email_contact' do
        # EmailContact.stub(:find) { mock_email_contact(update_attributes: false) }
        allow(EmailContact).to receive(:find) { mock_email_contact(update_attributes: false) }
        put :update, params: { id: mock_email_contact.id, email_contact: attrs }
        # assigns(:email_contact).should be(mock_email_contact)
        expect(response).to have_http_status(200)
      end

      xit "re-renders the 'edit' template" do
        # EmailContact.stub(:find) { mock_email_contact(update_attributes: false) }
        allow(EmailContact).to receive(:find) { mock_email_contact(update_attributes: false) }
        put :update, params: { id: mock_email_contact.id, email_contact: attrs }
        response.should render_template('edit')
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

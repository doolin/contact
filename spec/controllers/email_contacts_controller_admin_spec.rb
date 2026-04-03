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

  describe 'GET thankyou' do
    it 'assigns @thanks' do
      get :thankyou
      expect(assigns(:thanks)).to eq('Come back soon!')
    end

    it 'responds successfully' do
      get :thankyou
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET index' do
    it 'responds successfully for admin' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'assigns all email_contacts as @email_contacts' do
      contact = EmailContact.create!(valid_attrs)
      get :index
      expect(assigns(:email_contacts)).to eq([contact])
    end

    it 'renders xml for admin requests' do
      EmailContact.create!(valid_attrs)
      get :index, format: :xml
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/xml')
    end
  end

  describe 'GET show' do
    it 'assigns the requested email_contact as @email_contact' do
      contact = EmailContact.create!(valid_attrs)
      get :show, params: { id: contact.id }
      expect(response).to have_http_status(:ok)
      expect(assigns(:email_contact)).to eq(contact)
    end

    it 'renders xml for admin requests' do
      contact = EmailContact.create!(valid_attrs)
      get :show, params: { id: contact.id }, format: :xml
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/xml')
    end
  end

  describe 'GET new' do
    it 'assigns a new email_contact as @email_contact' do
      get :new
      expect(response).to have_http_status(:ok)
      expect(assigns(:email_contact)).to be_a_new(EmailContact)
    end

    it 'renders xml for new contact' do
      get :new, format: :xml
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/xml')
    end
  end

  describe 'GET edit' do
    it 'redirects to email_contacts index' do
      get :edit, params: { id: '37' }
      expect(response).to redirect_to(email_contacts_url)
    end
  end
end

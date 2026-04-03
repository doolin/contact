# frozen_string_literal: true

require 'spec_helper'

describe 'EmailContacts' do
  let(:valid_attrs) do
    {
      name: 'Test User',
      email: 'test@example.com',
      subject: 'Test Subject',
      message: 'Test message body'
    }
  end

  describe 'GET /email_contacts' do
    it 'redirects unauthenticated users to root' do
      get email_contacts_path
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET / (root_path)' do
    it 'renders the new contact form' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /thankyou' do
    it 'renders the thank you page' do
      get thankyou_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /email_contacts' do
    before do
      ActionMailer::Base.deliveries.clear
    end

    it 'creates a new contact with valid params' do
      allow_any_instance_of(EmailContactsController).to receive(:deliver)
      expect do
        post email_contacts_path, params: { email_contact: valid_attrs }
      end.to change(EmailContact, :count).by(1)
      expect(response).to redirect_to(thankyou_path)
    end

    it 'delivers both contact emails when save succeeds' do
      expect do
        post email_contacts_path, params: { email_contact: valid_attrs }
      end.to change(ActionMailer::Base.deliveries, :count).by(2)
      expect(response).to redirect_to(thankyou_path)
    end

    it 'does not create a contact with invalid params' do
      expect do
        post email_contacts_path, params: { email_contact: { name: '', email: '', subject: '', message: '' } }
      end.not_to change(EmailContact, :count)
    end

    it 'returns unprocessable_content for invalid xml requests' do
      post "#{email_contacts_path}.xml",
           params: { email_contact: { name: '', email: '', subject: '', message: '' } }
      expect(response).to have_http_status(:unprocessable_content)
    end
  end
end

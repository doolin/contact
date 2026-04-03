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
        expect do
          post :create, params: { email_contact: valid_attrs }
        end.to change(EmailContact, :count).by(1)
      end
    end
  end
end

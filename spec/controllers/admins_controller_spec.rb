# frozen_string_literal: true

require 'spec_helper.rb'

describe AdminsController do
  include Devise::Test::ControllerHelpers
  render_views

  describe '#new' do
    context 'when signed in' do
      before(:each) do
        @admin = Admin.create(email: 'admin@test.com', password: 'foobarski')
        sign_in(@admin, scope: :admin)
      end

      it 'responds successfully' do
        get :new
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

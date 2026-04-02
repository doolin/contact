# frozen_string_literal: true

require 'spec_helper'

describe RegistrationsController do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:admin]
  end

  describe '#new' do
    it 'responds successfully' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end
end

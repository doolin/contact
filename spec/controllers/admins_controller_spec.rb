# frozen_string_literal: true

require 'spec_helper.rb'

describe AdminsController do
  include Devise::Test::ControllerHelpers
  render_views

  before(:each) do
    @admin = Admin.create(password: '13')
    sign_in(@admin, scope: :admin)
  end

  describe '#sign_in' do
    xexample 'successfully' do
      # get '/login'
      get login_url
      response.should be_success
    end
  end
end

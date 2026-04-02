# frozen_string_literal: true

require 'spec_helper.rb'

describe AdminsController do
  include Devise::Test::ControllerHelpers

  # AdminsController has no resourceful routes defined,
  # so we cannot test it via controller specs.
  # The #new action exists but is not routable.
end

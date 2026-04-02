# frozen_string_literal: true

require 'spec_helper'

# RegistrationsController inherits from Devise::RegistrationsController.
# It is routed via devise_for :admins, not as a standalone controller.
# Devise routes map to 'devise/registrations', not 'registrations',
# so standard controller specs cannot route to this controller.
#
# The #new action is essentially empty (just a comment), so there is
# minimal behavior to test here.
describe RegistrationsController do
  it 'inherits from Devise::RegistrationsController' do
    expect(described_class.superclass).to eq(Devise::RegistrationsController)
  end
end

# frozen_string_literal: true

require 'spec_helper'

describe RegistrationsController do
  describe '#new' do
    it 'has a no-op action override' do
      expect(controller.send(:new)).to be_nil
    end
  end

  it 'inherits from Devise::RegistrationsController' do
    expect(described_class.superclass).to eq(Devise::RegistrationsController)
  end

  describe 'routing' do
    it 'routes GET /admins/sign_up to Devise registrations#new' do
      expect(get: '/admins/sign_up').to route_to('devise/registrations#new')
    end
  end
end

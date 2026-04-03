# frozen_string_literal: true

require 'spec_helper.rb'

describe AdminsController do
  describe '#new' do
    it 'has a no-op action body' do
      expect(controller.send(:new)).to be_nil
    end
  end

  describe 'routing' do
    it 'does not route GET /admins/new' do
      expect(get: '/admins/new').not_to be_routable
    end
  end
end

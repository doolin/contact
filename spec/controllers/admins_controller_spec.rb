# frozen_string_literal: true

require 'spec_helper.rb'

describe AdminsController do
  describe 'routing' do
    it 'does not route GET /admins/new' do
      expect(get: '/admins/new').not_to be_routable
    end
  end
end

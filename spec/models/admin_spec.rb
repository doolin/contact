# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Admin do
  context 'validations' do
    it 'requires correct email' do
      admin = Admin.new email: 'foo@bar.com', password: 'foobarski'
      expect(admin.valid?).to be true
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Admin do
  context 'validations' do
    it 'is valid with a correct email and password' do
      admin = Admin.new(email: 'foo@bar.com', password: 'foobarski')
      expect(admin).to be_valid
    end

    it 'is invalid without an email' do
      admin = Admin.new(email: '', password: 'foobarski')
      expect(admin).not_to be_valid
    end

    it 'is invalid with a malformed email' do
      admin = Admin.new(email: 'notanemail', password: 'foobarski')
      expect(admin).not_to be_valid
    end

    it 'is invalid without a password' do
      admin = Admin.new(email: 'foo@bar.com', password: '')
      expect(admin).not_to be_valid
    end

    it 'is invalid with a password shorter than minimum length' do
      admin = Admin.new(email: 'foo@bar.com', password: 'short')
      expect(admin).not_to be_valid
    end

    it 'requires unique email addresses' do
      Admin.create!(email: 'foo@bar.com', password: 'foobarski')
      duplicate = Admin.new(email: 'foo@bar.com', password: 'foobarski')
      expect(duplicate).not_to be_valid
    end
  end

  context 'devise modules' do
    it 'responds to valid_password?' do
      admin = Admin.new(email: 'foo@bar.com', password: 'foobarski')
      expect(admin).to respond_to(:valid_password?)
    end

    it 'responds to remember_me' do
      admin = Admin.new
      expect(admin).to respond_to(:remember_me)
    end

    it 'responds to reset_password_token' do
      admin = Admin.new
      expect(admin).to respond_to(:reset_password_token)
    end
  end
end

# frozen_string_literal: true

class Admin < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :email, :password, :password_confirmation, :remember_me

  validates :email, email: true
end

# frozen_string_literal: true

require 'ap' unless Rails.env.production?

class ApplicationController < ActionController::Base
  protect_from_forgery

  # def after_sign_in_path_for(resource)
  #   session["user_return_to"] || root_path
  # end
end

# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def new
    ap '#__FILE__}'
    # redirect_to root_path
  end

  # def create
  #   # add custom create logic here
  # end
  #
  # def update
  #   super
  # end
end

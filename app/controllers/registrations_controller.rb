class RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to root_path
  end

=begin
  def create
    # add custom create logic here
  end

  def update
    super
  end
=end
end

class ContactMailer < ActionMailer::Base

default :to => "david.doolin@gmail.com"

# todo: Add cc: to user.
  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:from => user.email,
         :subject => "Welcome to My Awesome Site")
  end

end

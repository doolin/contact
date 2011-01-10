class ContactMailer < ActionMailer::Base

default :to => "david.doolin@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:from => @user.email,
         :cc => @user.email,
         :reply_to => @user.email,
         :subject => "Email from #{@user.email}")
  end

end


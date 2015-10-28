class ContactMailer < ActionMailer::Base

  #default :to => "david.doolin@gmail.com"

  # TODO: Add URL to emails, then delete welcome_email method
  def welcome_email(user)
    @user = user
    #@url  = "http://example.com/login"
    mail(:from => @user.email,
         :cc => @user.email,
         :reply_to => @user.email,
         :subject => "Email from #{@user.email}")
  end

  def daves_copy(user)
    @user = user
    mail(:to => 'david.doolin@gmail.com',
         :from => @user.email,
         :subject => "ContactMe email: #{@user.subject}")
  end

  def contacts_copy(user)
    @user = user
    mail(:to => @user.email,
         :from => 'david.doolin@gmail.com',
         :subject => "Copy: #{@user.subject}")
  end

end

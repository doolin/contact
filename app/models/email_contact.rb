class EmailContact < ActiveRecord::Base

  attr_accessible :name, :email, :subject, :message

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true,
                   :length => { :maximum => 50}
  validates :email, :presence => true,
                    :format => { :with => email_regex }
  validates :subject, :presence => true,
                   :length => { :maximum => 80}
  validates :message, :presence => true,
                   :length => { :maximum => 500} 
end

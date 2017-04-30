
# frozen_string_literal: true

FactoryGirl.define do
  factory :email_contact do |ec|
    ec.name 'Dave Doolin'
    ec.email 'david.doolin2@gmail.com'
    ec.subject 'testing the contact mailer'
    ec.message 'The test message'
  end

  factory :admin do |a|
    a.email    'david.doolin2@gmail.com'
    a.password 'foobar'
  end
end

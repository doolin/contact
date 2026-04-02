# frozen_string_literal: true

FactoryBot.define do
  factory :email_contact do
    name { 'Dave Doolin' }
    email { 'david.doolin2@gmail.com' }
    subject { 'testing the contact mailer' }
    message { 'The test message' }
  end

  factory :admin do
    email { 'david.doolin2@gmail.com' }
    password { 'foobar' }
  end
end

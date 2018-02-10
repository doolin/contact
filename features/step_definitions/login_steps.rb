# frozen_string_literal: true

# From RSpec book, page 267
Given /^the following email_contacts exist:$/ do |contacts_table|
  # From https://github.com/aslakhellesoy/cucumber/wiki/Step-Argument-Transforms
  contacts_table.map_headers! { |header| header.downcase.to_sym }
  contacts_table.hashes.each do |hash|
    EmailContact.create!(hash)
  end
end

Given /^I am not authenticated$/ do
  visit('/logout')
end

Given /^I am an authenticated admin$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  Admin.new(email: email,
           password: password,
           password_confirmation: password).save!
  @email_contacts = EmailContact.all

  visit path_to("the admin's sign_in page")
  fill_in('admin_email', with: email)
  fill_in('admin_password', with: password)
  click_button('Log in')
end

Then /^I should land on the "Send me an email!" page$/ do
  # TODO: add an assertion here.
end

Given /^I click on the email "Delete" link$/ do
  deletes = all('a', text: 'Delete')
  deletes.first.click
end

Then /^the email is deleted$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I open the email$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I click on the resend link$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the email is resent$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I click on the forward link$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I fill in the forwarding email address$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the email is forwarded$/ do
  pending # express the regexp above with the code you wish you had
end

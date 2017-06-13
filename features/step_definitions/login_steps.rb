# frozen_string_literal: true

# From RSpec book, page 267
Given /^the following email_contacts exist:$/ do |contacts_table|
  # From https://github.com/aslakhellesoy/cucumber/wiki/Step-Argument-Transforms
  contacts_table.map_headers! { |header| header.downcase.to_sym }
  contacts_table.hashes.each do |hash|
    EmailContact.create!(hash)
  end
  # binding.pry
end

# From the Devise wiki:
Given /^I am not authenticated$/ do
  # visit('/admins/sign_out') # ensure that at least
  visit('/logout') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  User.new(email: email,
           login: login,
           password: password,
           password_confirmation: password).save!
end

Given /^I have one\s+admin "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  Admin.new(email: email,
           password: password,
           password_confirmation: password).save!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  login = 'Testing man'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}" and login "#{login}"}
  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /^I am an authenticated admin$/ do
  email = 'testing@man.net'
  login = 'Testing man'
  password = 'secretpass'
  Admin.new(email: email,
           password: password,
           password_confirmation: password).save!

  FactoryGirl.create :email_contact

  @email_contacts = EmailContact.all


  visit path_to("the admin's sign_in page")

  # binding.pry

  fill_in("admin_email", with: email)
  fill_in("admin_password", with: password)
  click_button("Log in")

  # puts "HERE!!!"

  # Given %{I have one admin "#{email}" with password "#{password}" and login "#{login}"}
  # And %{I go to the admin's sign_in page} # And %{I go to login}
  # And %{I fill in "admin_email" with "#{email}"}
  # And %{I fill in "admin_password" with "#{password}"}
  # And %{I press "Sign in"}
end

# This runs, but I don't think it does anything
#
#   before(:each) do
#     @admin = Admin.create("13")
#     sign_in(:admin,@admin)
#   end

# Given /^I fill in the "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
#  pending # express the regexp above with the code you wish you had
# end

# This isn't quite right, should use an already created admin
# and log that admin in.
Then /^I should land on the "Send me an email!" page$/ do
end

# This is currently failing because there are no emails
# in the email_contacts list.
Given /^I click on the email "Delete" link$/ do
  # save_and_open_page
  # first('Delete').click_link('Delete')

  deletes = all("a", :text => 'Delete')

  deletes.first.click

  # binding.pry

  # click_link('Delete')

  #  pending # express the regexp above with the code you wish you had
end

Then /^the email is deleted$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^not logged in user on any page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the "([^"]*)" link should not be displayed$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the user should be routed to index page$/ do
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

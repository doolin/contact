

# frozen_string_literal: true

Given /^I'm on the message sending form page$/ do
  visit('/')
  # pending # express the regexp above with the code you wish you had
end

# Given /^there's a message sending form web page$/ do
#  pending # express the regexp above with the code you wish you had
# end

When /^the user sends a message$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should get email$/ do
  pending # express the regexp above with the code you wish you had
end

# Given /^I fill in the "([^"]*)" field$/ do |value|
#  fill_in(field, :with => value)
#  #pending # express the regexp above with the code you wish you had
# end

Then /^Dave should get my email$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the "([^"]*)" page$/ do |arg1|
  # This should be simple, some webrat code I think.
  pending # express the regexp above with the code you wish you had
end

# TODO: the regex is problematic here, I should figure
# out how to do it correctly.
# Then /^I land on the (.+) page$/ do |page_name|
Then /^I land on the "Thank You" page$/ do
  current_path = URI.parse(current_url).path
  expect(current_path).to eq '/thankyou'
end



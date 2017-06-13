# frozen_string_literal: true

Given /^I'm on the message sending form page$/ do
  visit('/')
end

# TODO: the regex is problematic here, I should figure
# out how to do it correctly.
# Then /^I land on the (.+) page$/ do |page_name|
Then /^I land on the "Thank You" page$/ do
  current_path = URI.parse(current_url).path
  expect(current_path).to eq '/thankyou'
end

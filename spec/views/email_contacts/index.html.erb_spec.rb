# frozen_string_literal: true

require 'spec_helper'

describe 'email_contacts/index' do

  before(:each) do
    assign(
      :email_contacts,
      [
        mock_model(
          EmailContact,
          name: 'Name',
          email: 'Email',
          subject: 'Subject',
          message: 'Message'
        ),
        mock_model(
          EmailContact,
          name: 'Name',
          email: 'Email',
          subject: 'Subject',
          message: 'Message'
        )
      ]
    )
  end

  # This is failing due to the test for empty subject field
  # in index.html.erb at the moment.
  it 'renders a list of email_contacts' do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Subject'.to_s, count: 2
    assert_select 'tr>td', text: 'Message'.to_s, count: 2
  end

  #  it "should link to the home page from the header text"
end

# frozen_string_literal: true

require 'spec_helper'

describe 'email_contacts/thankyou' do
  before(:each) do
    assign(:email_contacts, mock_model(EmailContact,
        name: 'Name',
        email: 'Email',
        subject: 'Subject',
        message: 'Message'))
  end

  it 'should have Thanks' do
    render
    expect(rendered).to have_selector('p', text: 'Thanks')
  end

  it 'should have email message' do
    render
    expect(rendered).to have_selector('p', text: 'Thanks')
  end
end

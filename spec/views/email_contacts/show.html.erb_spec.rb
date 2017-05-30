# frozen_string_literal: true

require 'spec_helper'

describe 'email_contacts/show' do
  before(:each) do
    @email_contact = assign(:email_contact, stub_model(EmailContact,
      name: 'Name',
      email: 'Email',
      message: 'Message'
    ))
  end

  it 'renders attributes in <p>' do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Message/)
  end
end

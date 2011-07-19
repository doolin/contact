require 'spec_helper'


## This all should work but doesn't.
describe "email_contacts/show.html.erb" do

  before(:each) do
    @email_contact = assign(:email_contact, stub_model(EmailContact,
      :name => "Name",
      :email => "Email",
      :message => "Message"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Message/)
  end
end

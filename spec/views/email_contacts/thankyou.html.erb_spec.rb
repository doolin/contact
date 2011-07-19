require 'spec_helper'

describe "email_contacts/thankyou.html.erb" do

  before(:each) do
    assign(:email_contacts, mock_model(EmailContact,
        :name => "Name",
        :email => "Email",
        :subject => "Subject",
        :message => "Message"))
  end

  it "should have Thanks" do
    render
    rendered.should have_selector("p", :content => "Thanks")
  end

  it "should have email message" do
    render
    rendered.should have_selector("p", :message => "Thanks")
  end

end

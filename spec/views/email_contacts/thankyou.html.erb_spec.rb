require 'spec_helper'

describe "email_contacts/thankyou.html.erb" do

  it "should have Thanks" do
    render
    rendered.should have_selector("p", :content => "Thanks")
  end

  it "should have email message" do
    pending "Reason: Find a way to mock up the email and test it here"
  end

end

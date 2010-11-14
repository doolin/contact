require 'spec_helper'

describe "email_contacts/edit.html.erb" do
  before(:each) do
    @email_contact = assign(:email_contact, stub_model(EmailContact,
      :new_record? => false,
      :name => "Name",
      :email => "Email",
      :message => "Message"
    ))
  end

  it "renders the edit email_contact form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => email_contact_path(@email_contact), :method => "post" do
      assert_select "input#email_contact_name", :name => "email_contact[name]"
      assert_select "input#email_contact_email", :name => "email_contact[email]"
      assert_select "textarea#email_contact_message", :name => "email_contact[message]"
    end
  end
end

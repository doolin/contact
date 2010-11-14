require 'spec_helper'

describe "email_contacts/new.html.erb" do
  before(:each) do
    assign(:email_contact, stub_model(EmailContact,
      :name => "MyString",
      :email => "MyString",
      :message => "MyString"
    ).as_new_record)
  end

  it "renders new email_contact form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
#   assert_select "form", :action => email_contacts_path, :method => "post" do
    assert_select "form", :action => root_path, :method => "post" do
      assert_select "input#email_contact_name", :name => "email_contact[name]"
      assert_select "input#email_contact_email", :email => "email_contact[email]"
      assert_select "textarea#email_contact_message", :message => "email_contact[message]"
    end
  end
end

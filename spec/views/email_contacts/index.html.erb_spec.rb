require 'spec_helper'

describe "email_contacts/index.html.erb" do
  before(:each) do
    assign(:email_contacts, [
      stub_model(EmailContact,
        :name => "Name",
        :email => "Email",
        :message => "Message"
      ),
      stub_model(EmailContact,
        :name => "Name",
        :email => "Email",
        :message => "Message"
      )
    ])
  end

  it "renders a list of email_contacts" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Message".to_s, :count => 2
  end

  it "should link to the home page from the header text" 

end

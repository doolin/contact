require 'spec_helper'

describe 'email_contacts/new.html.erb' do
  # A good one to write would be to remove
  # one of the fields, say, "subject" and fail
  # the test.  The error is hard to understand
  # without having had it a few times.  Mention that
  # whenever something is added to the model, the
  # specs need to be updated as well.  Go into detail
  # about mock_model and stub_model
  #=begin
  before(:each) do
    assign(:email_contact, stub_model(EmailContact,
      name: 'MyString',
      email: 'MyString',
      subject: 'Subject',
      message: 'MyString'
    ).as_new_record)
  end
  #=end

  it 'should have Send' do
    render
    rendered.should have_selector('h2', text: 'Send')
  end

  it 'renders new email_contact form' do
    render

   # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
   assert_select 'form', action: email_contacts_path, method: 'post' do
     #    assert_select "form", :action => root_path, :method => "post" do
     assert_select 'input#email_contact_name', name: 'email_contact[name]'
      assert_select 'input#email_contact_email', email: 'email_contact[email]'
      assert_select 'textarea#email_contact_message', message: 'email_contact[message]'
   end
  end
end

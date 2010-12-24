
require 'spec_helper'

describe EmailContact do
  
  before(:each) do 
    @atts = {
      :name => "Foo le Bar",
      :email => "foolebar@barlefoo.com",
      :subject => "the curious incident",
      :message => "The dog didn't bark"
    }
  end
  
  it "should create a new instance given valid attributes" do
    EmailContact.create!(@atts)
  end
  
  
# Check requirements...  DRY these later
  it "should require a name" do
    no_name_email = EmailContact.new(@atts.merge(:name => ""))
    no_name_email.should_not be_valid
  end
  
  it "should require an email" do
    no_email_email = EmailContact.new(@atts.merge(:email => ""))
    no_email_email.should_not be_valid
  end
  
  it "should require a subject" do
    no_subject_email = EmailContact.new(@atts.merge(:subject => ""))
    no_subject_email.should_not be_valid
  end
  
  it "should require a message" do
    no_message_email = EmailContact.new(@atts.merge(:message => ""))
    no_message_email.should_not be_valid
  end

  it "should require a valid email" do
    no_valid_email_email = EmailContact.new(@atts.merge(:email => "foo le bar@barlefoo dot net"))
    no_valid_email_email.should_not be_valid
  end

  
end
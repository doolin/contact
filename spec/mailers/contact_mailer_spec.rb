require "spec_helper"

describe ContactMailer do

  before(:each) do
    @email_contact = Factory(:email_contact)
  end

  describe "contact_mailer" do
#    let(:mail) { ContactMailer.welcome_email(@email_contact) }
    let(:mail) { ContactMailer.daves_copy(@email_contact) }

    it "renders the headers" do
      mail.to.should eq(["david.doolin@gmail.com"])
      # The from field is overriden by Google, let's
      # test it here so that it will work when outgoing
      # SMTP server is changed to something else.
      #mail.from.should eq([@email_contact.email])
    end

    it "renders the body" do
      mail.body.encoded.should match("The test message")
    end
  end
end


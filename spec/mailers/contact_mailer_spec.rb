require "spec_helper"

describe ContactMailer do

  before(:each) do
    @email_contact = Factory(:email_contact)
  end

  describe "contact_mailer" do
    let(:mail) { ContactMailer.welcome_email(@email_contact) }

    it "renders the headers" do
      mail.to.should eq(["david.doolin@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("dave")
    end
  end
end


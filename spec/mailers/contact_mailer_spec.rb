# frozen_string_literal: true

require 'spec_helper'

describe ContactMailer do
  before(:each) do
    @email_contact = FactoryGirl.create(:email_contact)
  end

  describe 'contact_mailer' do
    let(:mail) { ContactMailer.daves_copy(@email_contact) }

    it 'renders the headers' do
      expect(mail.to).to eq ['david.doolin@gmail.com']

      # The from field is overridden by Google, let's
      # test it here so that it will work when outgoing
      # SMTP server is changed to something else.
      # mail.from.should eq([@email_contact.email])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match 'The test message'
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

describe ContactMailer do
  before(:each) do
    @email_contact = create(:email_contact)
  end

  describe '#daves_copy' do
    let(:mail) { ContactMailer.daves_copy(@email_contact) }

    it 'sends to the correct recipient' do
      expect(mail.to).to eq ['david.doolin@gmail.com']
    end

    it 'sets the from address to the contact email' do
      expect(mail.from).to eq [@email_contact.email]
    end

    it 'includes the subject in the email subject line' do
      expect(mail.subject).to eq "ContactMe email: #{@email_contact.subject}"
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match 'The test message'
    end

    it 'renders both html and text parts' do
      expect(mail.html_part.body.encoded).to include(@email_contact.message)
      expect(mail.text_part.body.encoded).to include(@email_contact.message)
    end
  end

  describe '#contacts_copy' do
    let(:mail) { ContactMailer.contacts_copy(@email_contact) }

    it 'sends to the contact email address' do
      expect(mail.to).to eq [@email_contact.email]
    end

    it 'sets the from address to dave' do
      expect(mail.from).to eq ['david.doolin@gmail.com']
    end

    it 'includes Copy: prefix in the subject' do
      expect(mail.subject).to eq "Copy: #{@email_contact.subject}"
    end

    it 'renders both html and text parts' do
      expect(mail.html_part.body.encoded).to include(@email_contact.name)
      expect(mail.text_part.body.encoded).to include(@email_contact.name)
    end
  end

  describe '#welcome_email' do
    let(:mail) { ContactMailer.welcome_email(@email_contact) }

    it 'sets from to the contact email' do
      expect(mail.from).to eq [@email_contact.email]
    end

    it 'CCs the contact email' do
      expect(mail.cc).to eq [@email_contact.email]
    end

    it 'sets reply_to to the contact email' do
      expect(mail.reply_to).to eq [@email_contact.email]
    end

    it 'includes the email in the subject line' do
      expect(mail.subject).to eq "Email from #{@email_contact.email}"
    end

    it 'renders both html and text parts' do
      expect(mail.html_part.body.encoded).to include(@email_contact.message)
      expect(mail.text_part.body.encoded).to include(@email_contact.message)
    end
  end
end

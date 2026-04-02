# frozen_string_literal: true

require 'spec_helper'

describe EmailContact do
  before(:each) do
    @atts = {
      name: 'Foo le Bar',
      email: 'foolebar@barlefoo.com',
      subject: 'the curious incident',
      message: "The dog didn't bark"
    }
  end

  it 'creates a new instance given valid attributes' do
    EmailContact.create!(@atts)
  end

  context 'validation' do
    it 'requires a name' do
      no_name_email = EmailContact.new(@atts.merge(name: ''))
      expect(no_name_email).not_to be_valid
    end

    it 'requires an email' do
      no_email_email = EmailContact.new(@atts.merge(email: ''))
      expect(no_email_email).not_to be_valid
    end

    it 'requires a subject' do
      no_subject_email = EmailContact.new(@atts.merge(subject: ''))
      expect(no_subject_email).not_to be_valid
    end

    it 'requires a message' do
      no_message_email = EmailContact.new(@atts.merge(message: ''))
      expect(no_message_email).not_to be_valid
    end

    it 'requires a valid email' do
      no_valid_email_email = EmailContact.new(@atts.merge(email: 'foo le bar@barlefoo dot net'))
      expect(no_valid_email_email).not_to be_valid
    end

    it 'rejects email without domain' do
      contact = EmailContact.new(@atts.merge(email: 'foo@'))
      expect(contact).not_to be_valid
    end

    it 'rejects email without local part' do
      contact = EmailContact.new(@atts.merge(email: '@bar.com'))
      expect(contact).not_to be_valid
    end

    it 'accepts valid email with subdomain' do
      contact = EmailContact.new(@atts.merge(email: 'foo@mail.bar.com'))
      expect(contact).to be_valid
    end

    it 'accepts valid email with hyphen in domain' do
      contact = EmailContact.new(@atts.merge(email: 'foo@bar-baz.com'))
      expect(contact).to be_valid
    end
  end

  context 'length validations' do
    it 'rejects name longer than 50 characters' do
      contact = EmailContact.new(@atts.merge(name: 'a' * 51))
      expect(contact).not_to be_valid
    end

    it 'accepts name of exactly 50 characters' do
      contact = EmailContact.new(@atts.merge(name: 'a' * 50))
      expect(contact).to be_valid
    end

    it 'rejects subject longer than 80 characters' do
      contact = EmailContact.new(@atts.merge(subject: 'a' * 81))
      expect(contact).not_to be_valid
    end

    it 'accepts subject of exactly 80 characters' do
      contact = EmailContact.new(@atts.merge(subject: 'a' * 80))
      expect(contact).to be_valid
    end

    it 'rejects message longer than 500 characters' do
      contact = EmailContact.new(@atts.merge(message: 'a' * 501))
      expect(contact).not_to be_valid
    end

    it 'accepts message of exactly 500 characters' do
      contact = EmailContact.new(@atts.merge(message: 'a' * 500))
      expect(contact).to be_valid
    end
  end
end

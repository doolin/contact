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
  end
end

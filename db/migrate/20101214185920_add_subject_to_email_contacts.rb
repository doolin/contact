# frozen_string_literal: true

class AddSubjectToEmailContacts < ActiveRecord::Migration[5.1]
  def self.up
    add_column :email_contacts, :subject, :string
  end

  def self.down
    remove_column :email_contacts, :subject
  end
end

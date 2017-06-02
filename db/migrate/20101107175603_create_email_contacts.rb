# frozen_string_literal: true

class CreateEmailContacts < ActiveRecord::Migration[5.1]
  def self.up
    create_table :email_contacts do |t|
      t.string :name
      t.string :email
      t.string :message

      t.timestamps
    end
  end

  def self.down
    drop_table :email_contacts
  end
end

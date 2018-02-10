# frozen_string_literal: true

class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :name
    end
  end
end

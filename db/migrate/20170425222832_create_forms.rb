# frozen_string_literal: true

class CreateForms < ActiveRecord::Migration[5.0]
  def change
    create_table :forms, id: false do |t|
      t.uuid :id, null: false
      t.uuid :application_id
      t.timestamps
    end
    add_index :forms, :application_id
    add_index :forms, :id, unique: true
  end
end

# frozen_string_literal: true

class CreateForms < ActiveRecord::Migration[5.0]
  def change
    create_table :forms, id: :uuid do |t|
      t.uuid :application_id
      t.timestamps
    end
    add_index :forms, :application_id
  end
end

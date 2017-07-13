# frozen_string_literal: true

class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys, id: :uuid do |t|
      t.uuid :application_id
      t.boolean :creator
      t.boolean :submitter
      t.boolean :analytics
      t.timestamps
    end
    add_index :api_keys, :application_id
  end
end

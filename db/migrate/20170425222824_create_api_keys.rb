# frozen_string_literal: true

class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.belongs_to :application, index: true, unique: true, foreign_key: true
      t.boolean :creator
      t.boolean :submitter
      t.boolean :analytics
      t.timestamps
    end
  end
end

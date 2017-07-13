# frozen_string_literal: true

class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections, id: false do |t|
      t.uuid :id, null: false
      t.uuid :form_id
      t.string :name
      t.integer :order
      t.text :content
      t.timestamps
    end
    add_index :sections, :form_id
    add_index :sections, :id, unique: true
  end
end

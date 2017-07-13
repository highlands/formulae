# frozen_string_literal: true

class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections, id: :uuid do |t|
      t.uuid :form_id
      t.string :name
      t.integer :order
      t.text :content
      t.timestamps
    end
    add_index :sections, :form_id
  end
end

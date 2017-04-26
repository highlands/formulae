# frozen_string_literal: true

class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.belongs_to :form, index: true, unique: true, foreign_key: true
      t.belongs_to :question, index: true, unique: true, foreign_key: true
      t.string :name
      t.text :content
      t.timestamps
    end
  end
end

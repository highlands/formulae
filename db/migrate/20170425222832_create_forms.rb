# frozen_string_literal: true

class CreateForms < ActiveRecord::Migration[5.0]
  def change
    create_table :forms do |t|
      t.belongs_to :application, index: true, unique: true, foreign_key: true
      t.timestamps
    end
  end
end

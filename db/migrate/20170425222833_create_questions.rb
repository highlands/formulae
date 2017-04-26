# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :label
      t.text :content
      t.boolean :hidden
      t.timestamps
    end
  end
end

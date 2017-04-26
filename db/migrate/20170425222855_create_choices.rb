# frozen_string_literal: true

class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.belongs_to :question, index: true, unique: true, foreign_key: true
      t.belongs_to :question_dependency, index: true
      t.jsonb :metadata, default: '{}'
      t.integer :maximum_chosen
      t.string :label
      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateQuestionDependencies < ActiveRecord::Migration[5.0]
  def change
    create_table :question_dependencies do |t|
      t.belongs_to :question, index: true, unique: true, foreign_key: true
      t.boolean :display
      t.boolean :and
      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateQuestionDependencies < ActiveRecord::Migration[5.0]
  def change
    create_table :question_dependencies, id: false do |t|
      t.uuid :id, null: false
      t.uuid :question_id
      t.boolean :display
      t.boolean :and
      t.timestamps
    end
    add_index :question_dependencies, :question_id
    add_index :question_dependencies, :id, unique: true
  end
end

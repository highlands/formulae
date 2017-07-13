# frozen_string_literal: true

class CreateQuestionDependencies < ActiveRecord::Migration[5.0]
  def change
    create_table :question_dependencies, id: :uuid do |t|
      t.uuid :question_id
      t.boolean :display
      t.boolean :and
      t.timestamps
    end
    add_index :question_dependencies, :question_id
  end
end

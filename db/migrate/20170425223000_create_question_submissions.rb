# frozen_string_literal: true

class CreateQuestionSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :question_submissions, id: :uuid do |t|
      t.uuid :form_submission_id
      t.uuid :question_id
      t.string :string
      t.text :text
      t.boolean :boolean
      t.integer :multi_select_id, index: true
      t.timestamps
    end
    add_index :question_submissions, :form_submission_id
    add_index :question_submissions, :question_id
  end
end

# frozen_string_literal: true

class CreateQuestionSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :question_submissions do |t|
      t.belongs_to :form_submission, index: true
      t.belongs_to :question, index: true
      t.string :string
      t.text :text
      t.boolean :boolean
      t.integer :multi_select_id, index: true
      t.timestamps
    end
  end
end

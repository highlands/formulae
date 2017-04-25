# frozen_string_literal: true

class CreateQuestionSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :question_submissions, &:timestamps
  end
end

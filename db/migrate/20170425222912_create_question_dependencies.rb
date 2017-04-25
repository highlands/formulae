# frozen_string_literal: true

class CreateQuestionDependencies < ActiveRecord::Migration[5.0]
  def change
    create_table :question_dependencies, &:timestamps
  end
end

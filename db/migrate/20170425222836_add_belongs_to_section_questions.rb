# frozen_string_literal: true

class AddBelongsToSectionQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :section, foreign_key: true
  end
end

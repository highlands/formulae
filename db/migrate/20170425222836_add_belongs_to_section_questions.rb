# frozen_string_literal: true

class AddBelongsToSectionQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :section_id, :uuid
    add_index :questions, :section_id
  end
end

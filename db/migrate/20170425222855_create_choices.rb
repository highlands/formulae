# frozen_string_literal: true

class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices, &:timestamps
  end
end

# frozen_string_literal: true

class CreateForms < ActiveRecord::Migration[5.0]
  def change
    create_table :forms, &:timestamps
  end
end

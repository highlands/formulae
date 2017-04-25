# frozen_string_literal: true

class CreateFormSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :form_submissions, &:timestamps
  end
end

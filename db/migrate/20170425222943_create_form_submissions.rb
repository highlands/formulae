# frozen_string_literal: true

class CreateFormSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :form_submissions do |t|
      t.belongs_to :form, index: true
      t.timestamps
    end
  end
end

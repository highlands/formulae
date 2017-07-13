# frozen_string_literal: true

class CreateFormSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :form_submissions, id: false do |t|
      t.uuid :id, null: false
      t.uuid :form_id
      t.timestamps
    end
    add_index :form_submissions, :form_id
    add_index :form_submissions, :id, unique: true
  end
end

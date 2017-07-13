# frozen_string_literal: true

class CreateFormSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :form_submissions, id: :uuid do |t|
      t.uuid :form_id
      t.timestamps
    end
    add_index :form_submissions, :form_id
  end
end

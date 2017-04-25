# frozen_string_literal: true

class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications, &:timestamps
  end
end

class AddNameToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :name, :string
  end
end

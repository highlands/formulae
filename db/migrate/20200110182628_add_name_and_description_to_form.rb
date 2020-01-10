class AddNameAndDescriptionToForm < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :name, :string
    add_column :forms, :description, :text
  end
end

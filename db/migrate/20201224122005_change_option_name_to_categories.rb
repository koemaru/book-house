class ChangeOptionNameToCategories < ActiveRecord::Migration[6.0]
  def change
    change_column :categories, :name, :string, null: false, unique: true
  end
end

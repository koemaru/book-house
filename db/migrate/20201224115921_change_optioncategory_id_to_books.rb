class ChangeOptioncategoryIdToBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :category_id, :integer, null: false
  end
end

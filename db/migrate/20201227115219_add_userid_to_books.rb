class AddUseridToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :user_id, :integer, null: false
  end
end

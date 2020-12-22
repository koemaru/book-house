class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :book_title,                  null: false
      t.text :article,                  null: false
      t.string :image,                  null: false
      t.timestamps
    end
  end
end

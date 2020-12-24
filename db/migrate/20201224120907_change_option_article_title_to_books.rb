class ChangeOptionArticleTitleToBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :article_title, :string, null: false
  end
end

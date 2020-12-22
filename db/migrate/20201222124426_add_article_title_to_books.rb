class AddArticleTitleToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :article_title, :string
  end
end

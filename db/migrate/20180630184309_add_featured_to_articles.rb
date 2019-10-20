class AddFeaturedToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :featured, :boolean, default: false
  end
end

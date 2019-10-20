class RemoveFeaturedImageFromArticle < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :featured_image
    remove_column :users, :authorc
    remove_column :categories, :cover_image_cat
  end
end

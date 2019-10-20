class AddFeaturedImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :featured_image, :string
  end
end

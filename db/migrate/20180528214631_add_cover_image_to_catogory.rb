class AddCoverImageToCatogory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :cover_image_cat, :string
  end
end

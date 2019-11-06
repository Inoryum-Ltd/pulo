class AddCategoryIdToMeta < ActiveRecord::Migration[6.0]
  def change
    add_column :meta, :category_id, :integer
  end
end

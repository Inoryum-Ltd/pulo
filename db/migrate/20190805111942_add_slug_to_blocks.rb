class AddSlugToBlocks < ActiveRecord::Migration[6.0]
  def change
    add_column :blocks, :slug, :string
    add_index :blocks, :slug, unique: true
  end
end

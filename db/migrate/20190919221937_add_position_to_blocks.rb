class AddPositionToBlocks < ActiveRecord::Migration[6.0]
  def change
    add_column :blocks, :block_postion, :string
    add_column :blocks, :show_title, :boolean, default: false
    add_column :blocks, :block_class, :string
  end
end

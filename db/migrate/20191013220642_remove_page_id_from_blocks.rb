class RemovePageIdFromBlocks < ActiveRecord::Migration[6.0]
  def change
    remove_column :blocks, :page_id
  end
end

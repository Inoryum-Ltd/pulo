class AddPageIdToMeta < ActiveRecord::Migration[6.0]
  def change
    add_column :meta, :page_id, :integer
  end
end

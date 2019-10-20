class CreatePageBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :page_blocks do |t|
      t.integer :page_id
      t.integer :block_id

      t.timestamps
    end
  end
end

class CreateBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.string :title
      t.text :body
      t.integer :page_id

      t.timestamps
    end
  end
end

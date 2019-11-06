class CreateMeta < ActiveRecord::Migration[6.0]
  def change
    create_table :meta do |t|
      t.string :meta_title
      t.text :meta_description
      t.string :meta_keyword

      t.timestamps
    end
  end
end

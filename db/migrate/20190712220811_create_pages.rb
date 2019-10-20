class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.boolean :add_menu, default: false
      t.string :page_class

      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :project_link
      t.integer :project_type_id

      t.timestamps
    end
  end
end

class AddSlugToProjectTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :project_types, :slug, :string
    add_index :project_types, :slug, unique: true
  end
end

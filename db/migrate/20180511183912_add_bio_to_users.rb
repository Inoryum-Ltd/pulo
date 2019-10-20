class AddBioToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bio, :text
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
  end
end

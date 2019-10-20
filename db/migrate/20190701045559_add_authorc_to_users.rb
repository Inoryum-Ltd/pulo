class AddAuthorcToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :authorc, :string
  end
end

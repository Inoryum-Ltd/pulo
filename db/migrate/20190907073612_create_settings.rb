class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.integer :singleton_guard

      t.timestamps
    end
  end
end

class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :blocks, :block_postion, :block_position
  end
end

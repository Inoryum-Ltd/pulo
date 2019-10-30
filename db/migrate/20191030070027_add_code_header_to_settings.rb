class AddCodeHeaderToSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :settings, :code_header, :text
    add_column :settings, :code_footer, :text
  end
end

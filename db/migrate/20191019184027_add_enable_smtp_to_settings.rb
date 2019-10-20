class AddEnableSmtpToSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :settings, :enable_smtp, :boolean, default: false
  end
end

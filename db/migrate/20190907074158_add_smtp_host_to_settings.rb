class AddSmtpHostToSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :settings, :smtp_host, :string
    add_column :settings, :title, :string
  end
end

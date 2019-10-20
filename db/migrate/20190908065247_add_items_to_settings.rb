class AddItemsToSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :settings, :site_title, :string
    add_column :settings, :site_tag, :string
    add_column :settings, :smtp_user, :string
    add_column :settings, :smtp_password, :string
    add_column :settings, :smtp_port, :string
    add_column :settings, :admin_email, :string
    add_column :settings, :domain, :string
    add_column :settings, :display_hero, :boolean
    add_column :settings, :hero_title, :string
    add_column :settings, :hero_content, :text
    add_column :settings, :hero_button_text, :string
    add_column :settings, :hero_button_link, :string
    add_column :settings, :item_per_page, :string
  end
end

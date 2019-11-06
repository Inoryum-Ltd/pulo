class AddArticleIdToMeta < ActiveRecord::Migration[6.0]
  def change
    add_column :meta, :article_id, :integer
  end
end

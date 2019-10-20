class Page < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :page_blocks
  has_many :blocks, through: :page_blocks
  has_rich_text :body
  has_one_attached :page_cover
  
  attr_accessor :remove_page_cover

  after_save :purge_page_cover, if: :remove_page_cover
  
  private def purge_page_cover
    page_cover.purge
  end
end

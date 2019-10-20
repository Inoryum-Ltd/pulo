class Block < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :page_blocks
  has_many :pages, through: :page_blocks
end

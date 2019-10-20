class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :article_categories
  has_many :article, through: :article_categories
  validates :name, presence: true,
             uniqueness: { case_sensitive: false }, 
             length: { minimum: 3, maximum: 80 }
  validates :description, length: { maximum: 300}
  has_one_attached :cover_image_cat
  

attr_accessor :remove_cover_image

after_save :purge_cover_image, if: :remove_cover_image

 private def purge_cover_image
    cover_image_cat.purge
  end
  
end

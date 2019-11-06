class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 150 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000000}
  validates :user_id, presence: true
  scope :featured, -> { where(featured: 'true') }
  has_rich_text :description
  has_one_attached :featured_image
  has_one :article_metum, :class_name => "Metum", :dependent => :destroy
  accepts_nested_attributes_for :article_metum, :allow_destroy => true
  attr_accessor :remove_featured_image

  after_save :purge_featured_image, if: :remove_featured_image

 private def purge_featured_image
    featured_image.purge
  end
  
  
end
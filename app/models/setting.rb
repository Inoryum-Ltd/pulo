class Setting < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
	validates :singleton_guard, presence: true, uniqueness: true, numericality: {equal_to: 1}
  before_validation :set_singleton_guard
  has_one_attached :site_logo 
  has_one_attached :hero_image
  has_one_attached :hero_bg
  
  attr_accessor :remove_site_logo 

  after_save :purge_site_logo , if: :remove_site_logo 

  private def purge_site_logo 
    site_logo.purge
  end

private
  def set_singleton_guard
    self.singleton_guard = 1
  end
end

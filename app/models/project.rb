class Project < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged
	belongs_to :project_type
	belongs_to :user
	has_one_attached :project_image
	has_rich_text :description
	attr_accessor :remove_project_image

	has_one :project_metum, :class_name => "Metum", :dependent => :destroy
  accepts_nested_attributes_for :project_metum, :allow_destroy => true
  
	after_save :purge_project_image, if: :remove_project_image

	private def purge_project_image
    project_image.purge
  end
end

class Project < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged
	belongs_to :project_type
	belongs_to :user
	has_one_attached :project_image
	has_rich_text :description
	
	attr_accessor :remove_project_image

	after_save :purge_project_image, if: :remove_project_image

	private def purge_project_image
    project_image.purge
  end
end

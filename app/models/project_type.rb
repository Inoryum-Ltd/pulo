class ProjectType < ApplicationRecord
	validates :name, presence: true
	has_many :projects
	extend FriendlyId
  friendly_id :name, use: :slugged
end

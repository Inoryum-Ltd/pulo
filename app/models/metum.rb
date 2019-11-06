class Metum < ApplicationRecord
	belongs_to :page, optional: true
	belongs_to :article, optional: true
	belongs_to :category, optional: true
	belongs_to :project, optional: true
end

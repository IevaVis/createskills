class Diyproject < ApplicationRecord
	has_many_attached :images
	belongs_to :parent
	validates :title, presence: true, length: { maximum: 50}
	validates :description, presence: true, length: { maximum: 500}

end

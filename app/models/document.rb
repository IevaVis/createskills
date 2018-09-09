class Document < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true
	belongs_to :teacher
end
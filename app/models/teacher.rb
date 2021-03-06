class Teacher < ApplicationRecord
	has_secure_password
	before_save {email.downcase!}
	validates :teacher_name, presence: true, length: { maximum: 30}
	validates :email, presence: true, uniqueness: { case_sensitive: false}
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
	validates :area_field, presence: true
	validates :grade_of_teaching, presence: true
	validates :teacher_country, presence: true
	has_many :documents, dependent: :destroy
end

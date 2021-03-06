class Resume < ActiveRecord::Base
  include Prawn::View
  belongs_to :user
  has_many :resume_educations
  has_many :educations, through: :resume_educations
  has_many :resume_skills
  has_many :skills, through: :resume_skills
  has_many :resume_experiences
  has_many :experiences, through: :resume_experiences
  validates_presence_of :title, :email, :first_name, :last_name, :phone_1, :address, :postal_code, :city, :state
end

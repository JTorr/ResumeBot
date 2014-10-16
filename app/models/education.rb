class Education < ActiveRecord::Base
  has_many :resume_educations
  has_many :resumes, through: :resume_educations
  validates_presence_of :institution
end

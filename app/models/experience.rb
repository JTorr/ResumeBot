class Experience < ActiveRecord::Base
  has_many :resume_experiences
  has_many :resumes, through: :resume_experiences
  validates_presence_of :company_name
end

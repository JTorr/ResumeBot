class Skill < ActiveRecord::Base
  has_many :resume_skills
  has_many :resumes, through: :resume_skills
  validates_presence_of :name, :resume_id
end

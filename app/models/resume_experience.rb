class ResumeExperience < ActiveRecord::Base
  belongs_to :experience
  belongs_to :resume
end

class ResumeEducation < ActiveRecord::Base
  belongs_to :education
  belongs_to :resume
end

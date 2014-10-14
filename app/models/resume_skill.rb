class ResumeSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :resume
end

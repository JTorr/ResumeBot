class Skill < ActiveRecord::Base
  belongs_to :resume
  validates_presence_of :name, :resume_id
end

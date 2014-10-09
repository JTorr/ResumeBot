class Education < ActiveRecord::Base
  validates_presence_of :Resume_id, :institution
  belongs_to :Resume
end

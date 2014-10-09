class Experience < ActiveRecord::Base
  belongs_to :Resume
  validates_presence_of :name, :Resume_id
end

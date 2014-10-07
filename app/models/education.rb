class Education < ActiveRecord::Base
  validates_presence_of :cv_id, :institution
  belongs_to :cv
end

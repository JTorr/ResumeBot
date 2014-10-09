class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :skills
  has_many :experiences
  has_many :educations
  validates_presence_of :email, :first_name, :last_name, :phone_1, :address, :postal_code, :city, :state
end

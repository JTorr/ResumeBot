class Cv < ActiveRecord::Base
  belongs_to :user
  has_many :skills, :experiences, :educations
  validates_presence_of :email, :first_name, :last_name, :phone_1, :address, :postal_code, :city, :state
end

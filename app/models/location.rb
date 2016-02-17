class Location < ActiveRecord::Base
  has_many :shifts
  has_many :users, through: :workplaces
end

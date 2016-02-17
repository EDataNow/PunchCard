class User < ActiveRecord::Base
  has_many :shifts, through: :assignments
  has_many :locations, through: :workplaces
end

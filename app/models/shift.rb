class Shift < ActiveRecord::Base
  belongs_to :locations, dependent: :destroy
  has_many :users, through: :assignments
end

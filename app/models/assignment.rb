class Assignment < ActiveRecord::Base
  belongs_to :users
  belongs_to :shifts
  #validates :shift_id, presence: true
  #validates :user_id, presence: true
end

class Assignment < ActiveRecord::Base
  belongs_to :users, dependent: :destroy
  belongs_to :shifts, dependent: :destroy
  #validates :shift_id, presence: true
  #validates :user_id, presence: true
end

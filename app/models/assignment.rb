# == Schema Information
#
# Table name: assignments
#
#  id         :integer          not null, primary key
#  shift_id   :integer
#  user_id    :integer
#  end_time   :datetime
#  reason     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#  location   :string
#

class Assignment < ActiveRecord::Base
  belongs_to :users
  belongs_to :shifts
  #validates :shift_id, presence: true
  #validates :user_id, presence: true
end

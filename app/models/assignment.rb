# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  shift_id    :integer
#  user_id     :integer
#  end_time    :datetime
#  reason      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :integer
#

class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :shift
  validates :shift_id, presence: true
  validates :user_id, presence: true

  scope :active, -> {where(end_time: nil)}
  scope :complete, -> {where.not(end_time: nil)}

end

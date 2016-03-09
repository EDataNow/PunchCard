# == Schema Information
#
# Table name: shifts
#
#  id         :integer          not null, primary key
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shift < ActiveRecord::Base
  belongs_to :location, dependent: :destroy
  has_many :assignments
  has_many :users, through: :assignments, foreign_key: :user_id#, dependent: :destroy

  scope :active, -> {where(end_time: nil)}
  scope :complete, -> {where.not(end_time: nil)}
end

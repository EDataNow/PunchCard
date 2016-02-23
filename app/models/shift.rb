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
  belongs_to :locations, dependent: :destroy
  has_many :users, through: :assignments, foreign_key: :user_id#, dependent: :destroy
end

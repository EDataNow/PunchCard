# == Schema Information
#
# Table name: workplaces
#
#  id          :integer          not null, primary key
#  shift_id    :integer
#  location_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Workplace < ActiveRecord::Base
  belongs_to :users
  belongs_to :locations
end

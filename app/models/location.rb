# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  name        :string
#  address     :string
#  shift_start :datetime
#  shift_end   :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class Location < ActiveRecord::Base
  has_many :shifts, dependent: :destroy

  has_many :workplaces, dependent: :destroy
  has_many :users, through: :workplaces, foreign_key: :user_id

  validates_presence_of :name

  scope :active_shift, -> {shifts.where(end_time: nil).first}

  def self.search(search)
  	if search
    	search_condition = "%" + search + "%"
      where(['name LIKE ? OR address LIKE ?', search_condition, search_condition])
  	else
    	all
  	end
  end

end

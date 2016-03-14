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
  has_many :shifts
  has_many :workplaces, dependent: :destroy
  has_many :users, through: :workplaces, foreign_key: :user_id
  validates :name, presence: true
  validates :users, presence: true

  def self.search(search)
  	if search
    	search_condition = "%" + search + "%"
      where(['name LIKE ? OR address LIKE ?', search_condition, search_condition])
  	else
    	all
  	end
  end

end

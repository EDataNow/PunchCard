# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  last_name              :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  admin                  :boolean
#  authentication_token   :string
#

class User < ActiveRecord::Base
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :first_name, :last_name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_many :assignments, dependent: :destroy
  has_many :shifts, through: :assignments, foreign_key: :shift_id

  has_many :workplaces, dependent: :destroy
  has_many :locations, through: :workplaces, foreign_key: :location_id

  def self.search(search)
  	if search
    	search_condition = "%" + search + "%"
      where(['first_name LIKE ? OR last_name LIKE ? OR email LIKE ?', search_condition, search_condition, search_condition])
  	else
    	all
  	end
  end

end

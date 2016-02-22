class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shifts, through: :assignments, foreign_key: :shift_id#, dependent: :destroy
  has_many :locations, through: :workplaces
end

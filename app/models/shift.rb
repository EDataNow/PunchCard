class Shift < ActiveRecord::Base
  belongs_to :locations, dependent: :destroy
  has_many :users, through: :assignments, foreign_key: :user_id, dependent: :destroy
end

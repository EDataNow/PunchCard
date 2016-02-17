class Assignment < ActiveRecord::Base
  belongs_to :users, dependent :destroy
  belongs_to :shifts, dependent :destroy
end

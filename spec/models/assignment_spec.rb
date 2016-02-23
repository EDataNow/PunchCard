# == Schema Information
#
# Table name: assignments
#
#  id         :integer          not null, primary key
#  shift_id   :integer
#  user_id    :integer
#  end_time   :datetime
#  reason     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#  location   :string
#

require 'rails_helper'

RSpec.describe Assignment, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
end

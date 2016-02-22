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

require 'rails_helper'

RSpec.describe Workplace, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

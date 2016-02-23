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

require 'rails_helper'

RSpec.describe "Locations", type: :request do
  describe "GET /locations" do


  end
end

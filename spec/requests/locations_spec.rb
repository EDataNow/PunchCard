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
    it "works! (now write some real specs)" do
      get locations_path
      expect(response).to have_http_status(200)
    end
  end
end

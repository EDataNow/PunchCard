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

RSpec.describe "Assignments", type: :request do
  describe "GET /assignments" do
    it "works! (now write some real specs)" do
      get assignments_path
      expect(response).to have_http_status(200)
    end
  end
end

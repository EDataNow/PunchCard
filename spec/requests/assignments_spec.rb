# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  shift_id    :integer
#  user_id     :integer
#  end_time    :datetime
#  reason      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :integer
#

require 'rails_helper'

RSpec.describe "Assignments", type: :request do

  it "GETs the index of assignments" do
=begin
    get '/assignments'
    FactoryGirl.create(:user)
    expect(response).to contain("foo")=end
=end
  end

end

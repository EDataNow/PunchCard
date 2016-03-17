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

RSpec.describe AssignmentsController, type: :controller do
  login_user

  it "gets the assignments index" do
    get :index
    expect(response.status).to eq(200)
  end

  it "creates a new assignment when requested" do
    @user = create(:user)
    @location = create(:location)
    expect(@user.assignments.first).to be_nil
    post :create, {assignment: {user_id: @user.id}, shift: {location_id: @location.id}}

  end

end

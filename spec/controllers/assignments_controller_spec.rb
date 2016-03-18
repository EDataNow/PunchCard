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

    it 'gets the assignment index' do
      get :index, format: :html
      expect(response.status).to eq(200)
    end

    it "creates a new assignment" do
      @user = create(:user)
      @location = create(:location)
      expect(@user.assignments.find_by(user_id: @user.id)).to be_nil
      post :create, {assignment: {user_id: @user.id}, shift: {location_id: @location.id}}
      expect(@user.assignments.find_by(user_id: @user.id)).not_to be_nil
    end

  it "is archived with an end_time value instead of deleted" do
    skip("before_action hook not working")
    @assignment = create(:assignment)
    expect(@assignment).not_to be_nil
    expect(@assignment.end_time).to be_nil
    @assignment.destroy
    expect(Assignment.find(@assignment.id)).not_to be_nil
    expect(@assignment.end_time).not_to be_nil
  end

end

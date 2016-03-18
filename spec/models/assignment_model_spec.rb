require 'rails_helper'

describe Assignment, type: :model do

  it "has a valid factory" do
    @assignment = create(:assignment)
    expect(@assignment).to be_valid
    expect(@assignment.user).to be_valid
    expect(@assignment.shift).to be_valid
  end

  context 'validation' do
    it "fails without a user_id" do
      expect(build(:assignment, user_id: nil)).not_to be_valid
    end
    it "fails without a shift_id" do
      expect(build(:assignment, shift_id: nil)).not_to be_valid
    end
  end

  it "is destroyed if the associated user is destroyed" do
    @shift = create(:shift)
    @shift.users << create(:user, id: 1)
    @assignments = Assignment.all
    expect(@assignments.find_by(user_id: 1)).not_to be_nil
    User.find(1).destroy
    expect(@assignments.find_by(user_id: 1)).to be_nil
  end

  it "is destroyed if the associated shift is destroyed" do
    @user = create(:user)
    @user.shifts << create(:shift, id: 1)
    @assignments = Assignment.all
    expect(@assignments.find_by(shift_id: 1)).not_to be_nil
    Shift.find(1).destroy
    expect(@assignments.find_by(shift_id: 1)).to be_nil
  end

end
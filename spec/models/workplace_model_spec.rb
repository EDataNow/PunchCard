require 'rails_helper'

describe Workplace, type: :model do

  it 'has a valid factory' do
    @workplace = create(:workplace)
    expect(@workplace).to be_valid
    expect(@workplace.location).to be_valid
    expect(@workplace.user).to be_valid
  end

  context 'validation' do
    it 'fails without a user id' do
      expect(build(:workplace, user_id: nil)).not_to be_valid
    end
    it 'fails without a user id' do
      expect(build(:workplace, location_id: nil)).not_to be_valid
    end
  end

  it "is destroyed if the associated location is destroyed" do
    @user = create(:user)
    @user.locations << create(:location, id: 1)
    @workplaces = Workplace.all
    expect(@workplaces.find_by(location_id: 1)).not_to be_nil
    Location.find(1).destroy
    expect(@workplaces.find_by(location_id: 1)).to be_nil
  end

  it "is destroyed if the associated user is destroyed" do
    @location = create(:location)
    @location.users << create(:user, id: 1)
    @workplaces = Workplace.all
    expect(@workplaces.find_by(user_id: 1)).not_to be_nil
    User.find(1).destroy
    expect(@workplaces.find_by(user_id: 1)).to be_nil
  end

end
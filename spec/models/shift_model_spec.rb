require 'rails_helper'

describe Shift, type: :model do

  it 'has a valid factory' do
    @shift = create(:shift)
    expect(@shift).to be_valid
    expect(@shift.location).to be_valid
  end

  context 'validation' do
    it 'fails without a valid location' do
      expect(build(:shift, location_id: nil)).not_to be_valid
    end
  end

  it 'is destroyed if the associated location is destroyed' do
    @location = create(:location, id: 1)
    @location.shifts << create(:shift)
    @shifts = Shift.all
    expect(@shifts.find_by(location_id: 1)).not_to be_nil
    Location.find(1).destroy
    expect(@shifts.find_by(location_id: 1)).to be_nil
  end

end
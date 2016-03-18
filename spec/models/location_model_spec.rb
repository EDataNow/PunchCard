require 'rails_helper'

describe Location, type: :model do

  it 'has a valid factory' do
      @location = create(:location)
      expect(@location).to be_valid
  end

  context 'validation' do
    it 'fails without a name' do
      expect(build(:location, name: nil)).not_to be_valid
    end
  end

end
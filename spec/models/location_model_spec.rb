require 'rails_helper'

describe Location do

  it 'has a valid factory' do
      @location = create(:location)
      expect(@location).to be_valid
  end

  context 'validation' do
    it 'fails without a first and last name' do
      expect(build(:location, name: nil)).not_to be_valid
    end
  end

end
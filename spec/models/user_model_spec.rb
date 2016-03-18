require "rails_helper"

describe User, type: :model do

  it 'has a valid factory' do
      @user = create(:user)
      expect(@user).to be_valid
      expect(@user.admin).to be false

      @admin = create(:user, admin: true)
      expect(@admin).to be_valid
      expect(@admin.admin).to be true
end

  context 'validation' do
    it 'fails without an email' do
      expect(build(:user, email: nil)).not_to be_valid
    end

    it 'fails without a first and last name' do
      expect(build(:user, first_name: nil)).not_to be_valid
      expect(build(:user, last_name: nil)).not_to be_valid
    end

    it 'fails if email is not unique' do
      @user = create(:user, email: "email@punchcard.net")
      expect(build(:user, email: "email@punchcard.net")).not_to be_valid
    end
  end

end
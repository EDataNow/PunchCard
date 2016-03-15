require 'rails_helper'

RSpec.describe "FactoryGirl" do

  it 'makes a user' do
    @user = create(:user)
    expect(@user.last_name).to be_kind_of(String)
    expect(@user.email).to include("@punchcard.net")
    expect(@user.password.length).to be >7
    expect(@user.password.length).to be <17
    expect(@user.password).to be_kind_of String
  end

  it 'makes a shift when creating a location' do
    @location = create(:location)
    expect(@location.shifts.first).not_to be_nil
  end

  it 'can override defaults' do
    @user = create(:user)
    @admin = create(:user, admin: true)
    expect(@user.admin).to be false
    expect(@admin.admin).to be true
  end

end
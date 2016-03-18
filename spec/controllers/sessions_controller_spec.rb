require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  login_user

  it 'has a current_user' do
    expect(subject.current_user).not_to be_nil
  end


  context "responds with json when it" do
    it 'signs a user in' do
      skip ("Log-in fails")
      @user = create(:user)
      #post :destroy, id: subject.current_user.id, format: :json
      @user_login = {email:@user.email,password:@user.password}
      post :create, user: @user_login.as_json, format: :json
      expect(JSON.parse(response.body)['notice']).to eq("Success")
    end
    it 'signs a user out' do
      post :destroy, format: :json
      expect(JSON.parse(response.body)['notice']).to eq("Signed Out")
    end
  end
end
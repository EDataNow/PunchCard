require 'rails_helper'

describe ShiftsController, type: :controller do
  login_user

  context "responds with html when it" do
    it 'gets a specific shift' do
      @shift = create(:shift)
      get :show, id: @shift.id, format: :html
      expect(response.status).to eq(200)
    end

  end

  context "responds with json when it" do
    it 'gets a shift' do
      @shift = create(:shift)
      get :show, id: @shift.id, format: :json
      expect(JSON.parse(response.body)["shift"]["id"]).to eq(@shift.id.as_json)
    end
  end


end
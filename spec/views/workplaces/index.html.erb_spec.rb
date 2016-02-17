require 'rails_helper'

RSpec.describe "workplaces/index", type: :view do
  before(:each) do
    assign(:workplaces, [
      Workplace.create!(
        :shift_id => 1,
        :location_id => 2
      ),
      Workplace.create!(
        :shift_id => 1,
        :location_id => 2
      )
    ])
  end

  it "renders a list of workplaces" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :name => "Name",
        :address => "Address",
        :shift_start => "",
        :shift_end => ""
      ),
      Location.create!(
        :name => "Name",
        :address => "Address",
        :shift_start => "",
        :shift_end => ""
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end

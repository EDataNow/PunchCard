require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :name => "MyString",
      :address => "MyString",
      :shift_start => "",
      :shift_end => ""
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do

      assert_select "input#location_name[name=?]", "location[name]"

      assert_select "input#location_address[name=?]", "location[address]"

      assert_select "input#location_shift_start[name=?]", "location[shift_start]"

      assert_select "input#location_shift_end[name=?]", "location[shift_end]"
    end
  end
end

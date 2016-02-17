require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      :name => "MyString",
      :address => "MyString",
      :shift_start => "",
      :shift_end => ""
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input#location_name[name=?]", "location[name]"

      assert_select "input#location_address[name=?]", "location[address]"

      assert_select "input#location_shift_start[name=?]", "location[shift_start]"

      assert_select "input#location_shift_end[name=?]", "location[shift_end]"
    end
  end
end

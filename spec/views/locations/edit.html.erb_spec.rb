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

end

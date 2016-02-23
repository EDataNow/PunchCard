require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :name => "Name",
      :address => "Address",
      :shift_start => "",
      :shift_end => ""
    ))
  end

end

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

end

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


end

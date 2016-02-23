require 'rails_helper'

RSpec.describe "workplaces/new", type: :view do
  before(:each) do
    assign(:workplace, Workplace.new(
      :shift_id => 1,
      :location_id => 1
    ))
  end

end

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

end

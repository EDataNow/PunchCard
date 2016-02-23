require 'rails_helper'

RSpec.describe "workplaces/edit", type: :view do
  before(:each) do
    @workplace = assign(:workplace, Workplace.create!(
      :shift_id => 1,
      :location_id => 1
    ))
  end

end

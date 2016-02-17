require 'rails_helper'

RSpec.describe "workplaces/show", type: :view do
  before(:each) do
    @workplace = assign(:workplace, Workplace.create!(
      :shift_id => 1,
      :location_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end

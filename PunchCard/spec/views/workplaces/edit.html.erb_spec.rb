require 'rails_helper'

RSpec.describe "workplaces/edit", type: :view do
  before(:each) do
    @workplace = assign(:workplace, Workplace.create!(
      :shift_id => 1,
      :location_id => 1
    ))
  end

  it "renders the edit workplace form" do
    render

    assert_select "form[action=?][method=?]", workplace_path(@workplace), "post" do

      assert_select "input#workplace_shift_id[name=?]", "workplace[shift_id]"

      assert_select "input#workplace_location_id[name=?]", "workplace[location_id]"
    end
  end
end

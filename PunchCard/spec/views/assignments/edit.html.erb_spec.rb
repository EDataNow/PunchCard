require 'rails_helper'

RSpec.describe "assignments/edit", type: :view do
  before(:each) do
    @assignment = assign(:assignment, Assignment.create!(
      :shift_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit assignment form" do
    render

    assert_select "form[action=?][method=?]", assignment_path(@assignment), "post" do

      assert_select "input#assignment_shift_id[name=?]", "assignment[shift_id]"

      assert_select "input#assignment_user_id[name=?]", "assignment[user_id]"
    end
  end
end

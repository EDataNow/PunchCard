require 'rails_helper'

RSpec.describe "assignments/new", type: :view do
  before(:each) do
    assign(:assignment, Assignment.new(
      :shift_id => 1,
      :user_id => 1
    ))
  end

  it "renders new assignment form" do
    render

    assert_select "form[action=?][method=?]", assignments_path, "post" do

      assert_select "input#assignment_shift_id[name=?]", "assignment[shift_id]"

      assert_select "input#assignment_user_id[name=?]", "assignment[user_id]"
    end
  end
end

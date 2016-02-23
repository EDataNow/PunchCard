require 'rails_helper'

RSpec.describe "assignments/new", type: :view do
  before(:each) do
    assign(:assignment, Assignment.new(
      :shift_id => 1,
      :user_id => 1
    ))
  end

end

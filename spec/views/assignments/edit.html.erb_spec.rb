require 'rails_helper'

RSpec.describe "assignments/edit", type: :view do
  before(:each) do
    @assignment = assign(:assignment, Assignment.create!(
      :shift_id => 1,
      :user_id => 1
    ))
  end

end

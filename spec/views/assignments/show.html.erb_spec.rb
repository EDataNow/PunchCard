require 'rails_helper'

RSpec.describe "assignments/show", type: :view do
  before(:each) do
    @assignment = assign(:assignment, Assignment.create!(
      :shift_id => 1,
      :user_id => 2
    ))
  end

end

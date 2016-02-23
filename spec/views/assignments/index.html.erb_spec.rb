require 'rails_helper'

RSpec.describe "assignments/index", type: :view do
  before(:each) do
    assign(:assignments, [
      Assignment.create!(
        :shift_id => 1,
        :user_id => 2
      ),
      Assignment.create!(
        :shift_id => 1,
        :user_id => 2
      )
    ])
  end


end

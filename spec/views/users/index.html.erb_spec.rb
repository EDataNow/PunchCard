require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(first_name: "First", last_name: "Last1", email: "email1@edn.test", password: "password1"),
      User.create!(first_name: "First", last_name: "Last2", email: "email2@edn.test", password: "password2")
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "First".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(first_name: "First", last_name: "Last", email: "email@edn.test", password: "password"))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First/)
  end
end

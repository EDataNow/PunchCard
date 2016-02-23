require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new( first_name: "First", last_name: "Last", email: "email@edn.test", password: "password"))
  end

end

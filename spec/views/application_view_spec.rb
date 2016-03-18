require 'rails_helper'

describe "Application view", type: :view do
  include LoginHelper
  let(:target_url) {"http://localhost:3000/"}
  let(:driver) {Selenium::WebDriver.for :firefox}

  it 'displays the banner', login_as: :admin do
      expect { driver.find_element(:id, 'logo')}.not_to raise_error
      expect { driver.find_element(:id, 'Title')}.not_to raise_error
      expect { driver.find_element(id: 'greeting')}.not_to raise_error
      expect { driver.find_element(id: 'LogOut')}.not_to raise_error
  end

end

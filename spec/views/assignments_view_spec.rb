require 'rails_helper'

describe "Assignments view", type: :view do
  include LoginHelper
  let(:target_url) {"http://localhost:3000/"}
  let(:driver) {Selenium::WebDriver.for :firefox}
  let(:element_missing) {Selenium::WebDriver::Error::NoSuchElementError}

  it 'renders the correct Punch button' do
    if (driver.find_elements(id: 'user_id_3').empty?)
      expect { driver.find_element(id: 'punch_in')}.not_to raise_error
      expect { driver.find_element(id: 'shift_location_id')}.not_to raise_error
      expect { driver.find_element(id: 'punch_out') }.to raise_error(element_missing)
    else
      expect { driver.find_element(id: 'punch_out') }.not_to raise_error
      expect { driver.find_element(id: 'shift_location_id')}.to raise_error(element_missing)
      expect { driver.find_element(id: 'punch_in') }.to raise_error(element_missing)
    end
  end

end

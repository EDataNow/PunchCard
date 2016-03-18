require "rails_helper"

describe 'Shifts view' do
  include LoginHelper
  let(:target_url) {"http://localhost:3000/"}
  let(:driver) {Selenium::WebDriver.for :firefox}
  let(:element_missing) {Selenium::WebDriver::Error::NoSuchElementError}

  it 'renders the correct Punch button' do

  end

end
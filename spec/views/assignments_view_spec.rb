require 'rails_helper'

describe "Assignments view", type: :view do
  include LoginHelper

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://punch-card-staging.herokuapp.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 5
  end

  after(:each) do
    @driver.quit
  end

  it 'displays the logo' do
    login_as('user')
    sleep(3)
    log_out
  end

end



    # @driver.navigate.to "http://google.com"
    # @driver.find_element(:link_text, ("Images")).click
    # @element = @driver.find_element(:name, 'q')
    # @element.send_keys "Pluralsight"
    # @element.submit
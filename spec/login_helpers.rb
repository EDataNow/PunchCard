module LoginHelper

  def login_as (user_type)
    @driver.navigate.to @base_url+"sign-in"
    @account = of_type(user_type)
    @driver.find_element(:id, 'user_email').send_keys @account[:email]
    @driver.find_element(:id, 'user_password').send_keys @account[:password]
    @driver.find_element(:name, 'commit').click
  end

  def log_out
    @driver.find_element(:id, "LogOut").click
  end

  private

  def of_type(user_type = :user)
    case user_type
    when :user, 'user'
      {email: 'user3@punchcard.net', password:'password3'}
    when :admin, 'admin'
      {email: 'user1@punchcard.net', password:'password1'}
    end
  end

end
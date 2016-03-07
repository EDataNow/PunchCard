class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery except: [:sign_in]

  def debug_frame
    puts "-------------------------"
    puts ( yield || "Returned NIL" )
    puts "-------------------------"
  end

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to login_path, :notice => 'Please Log In'
    end
  end

end

class RegistrationsController < Devise::RegistrationsController

  before_filter :sign_up_params, :only => [:create]

  private

  def sign_up_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
  end

end
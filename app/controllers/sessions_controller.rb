class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    render :json => {
        'csrfParam' => request_forgery_protection_token,
        'csrfToken' => form_authenticity_token
    }
  end

end

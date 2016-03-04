class SessionsController < Devise::SessionsController
  respond_to :json


  def create
    respond_to do |format|
      format.html { super }
      format.json {
        warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
        render json: {
          notice: "Success",
          'csrfParam': request_forgery_protection_token,
          'token': form_authenticity_token }, status: 200
      }
    end
  end

  def destroy
    respond_to do |format|
      format.html { super }
      format.json {
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        render :json => {
          notice: "Signed Out"
          'csrfParam' => request_forgery_protection_token,
          'token' => form_authenticity_token
        }
      }
    end
  end

end

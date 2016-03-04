class SessionsController < Devise::SessionsController
  respond_to :json


  def create
    respond_to do |format|
      format.html { super }
      format.json {
        warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
        render status: 200, json: {
          error: "Success",
          'csrfParam': request_forgery_protection_token,
          'token': form_authenticity_token }
      }
    end
  end
end

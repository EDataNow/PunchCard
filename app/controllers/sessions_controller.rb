class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    respond_to do |format|
      format.html { super }
      format.json {
        @assignment = Assignment.new
        warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
        render json: {
            notice: "Success",
            'csrfParam': request_forgery_protection_token,
            token: form_authenticity_token,
            user: current_user.as_json,
            active: Assignment.find_by(user_id: current_user.id).present?,
            current_shift: Shift.find_by(id: assign_to_shift).as_json,
          },
          status: 200
      }
    end
  end

  def destroy
    respond_to do |format|
      format.html { super }
      format.json {
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        render :json => {
          notice: "Signed Out",
          'csrfParam' => request_forgery_protection_token,
          'token' => form_authenticity_token
        }
      }
    end
  end

  def assign_to_shift
      latest_shift = Shift.last
      Shift.create if latest_shift == nil || latest_shift.end_time != nil
      Shift.last.id
  end
  helper_method :assign_to_shift

end

class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    respond_to do |format|
      format.html { super }
      format.json {
        warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
        @assignment = Assignment.new
        @active_assignment = Assignment.where(user_id: current_user.id).active.first || "None"
        render json: {
            notice: "Success",
            user: current_user,
            active_assignment: @active_assignment,
            locations: compose_location_list(current_user),
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
        render json: {
          notice: "Signed Out",
          'csrfParam': request_forgery_protection_token,
          'token': form_authenticity_token
        }
      }
    end
  end

  def compose_location_list(user)
    @locations = []
    user.locations.each do |loc|
      @locations.push({id: loc.id, name: loc.name, active_shift: loc.shifts.active.first.as_json(include: {assignments: {include: {user: {only: [:first_name, :last_name, :email]} }}}),})
    end
    @locations
  end


end

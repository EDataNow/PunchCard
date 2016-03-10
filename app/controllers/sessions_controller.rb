class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    respond_to do |format|
      format.html { super }
      format.json {
        warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
        @assignment = Assignment.new
        @active_assignment = true if (Assignment.find_by(user_id: current_user.id) != nil)
        @locations = {}
        current_user.locations.each do |loc|
          @locations[loc.id] = {active_shift: loc.shifts.active.as_json(include: {assignments: {include: {user: {only: [:first_name, :last_name, :email]} }}}), name: loc.name}
        end
        render json: {
            notice: "Success",
            user: current_user,
            locations: @locations,
            active_assignment: @active_assignment,
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

  def assign_to_shift(location_id)
      latest_shift = Shift.where(location_id: location_id).last
      Shift.create(location_id: location_id) if latest_shift == nil || latest_shift.end_time != nil
      Shift.where(location_id: location_id).last.id
  end
  helper_method :assign_to_shift

  def compose_mobile_response
    @composition = {}
  end



end

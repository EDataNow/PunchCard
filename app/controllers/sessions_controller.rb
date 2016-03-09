class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    respond_to do |format|
      format.html { super }
      format.json {
        @locations = {}
        @assignment = Assignment.new
        current_user.locations.each do |loc|
        #Location.all.each do |loc|
          @locations[loc.id] = {shift: loc.shifts.active.to_json(include: {assignments: {include: {user: {only: [:first_name, :last_name, :email]} }}}), name: loc.name}
        end

        warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
        render json: {
            notice: "Success",
            user: current_user.as_json,
            locations: @locations.as_json,
            active_assignment: Assignment.find_by(user_id: current_user.id).as_json,
            current_shift: Shift.find_by(id: assign_to_shift(1)).as_json,
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

# == Schema Information
#
# Table name: shifts
#
#  id         :integer          not null, primary key
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :json

  # GET /shifts
  # GET /shifts.json
  def index
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
    respond_to do |format|
      format.html {}
      format.json {render json: {
        assignments: expand_assignments
      }, status: :ok
    }
    end
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts
  # POST /shifts.json
  def create
    @shift = Shift.new(shift_params)

    respond_to do |format|
      if @shift.save
        format.html { redirect_to @shift, notice: 'Shift was successfully created.' }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_url, notice: 'Shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_params
      params.require(:shift).permit(:location_id, :utf8, :authenticity_token)
    end

    def expand_assignments
      @expanded_assignments = {}
      Shift.find(params[:id]).assignments.each do |a|
        @user = User.find(a.user_id)
        @location = Location.find(a.location_id)
        @expanded_assignments[a.id] = {user: {first_name: @user.first_name, last_name: @user.last_name, email: @user.email}, start_time: a.created_at, location: {name: @location.name}}
      end
      @expanded_assignments.as_json
    end
    helper_method :expand_assignments
end

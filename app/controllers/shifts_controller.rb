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
  before_action :set_end_time, only: [:destroy]
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
      format.json {
        @shift = Shift.find(params[:id]).as_json(include: {assignments: {include: {user: {only: [:first_name, :last_name, :email]} }}})
        render json: {shift: @shift}, status: :ok
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

    def check_last_out
      @shift.end_time = @shift.end_time || DateTime.now unless @shift.assignments.active
    end

    def set_end_time
      @shift.end_time = @shift.end_time || DateTime.now
      @shift.save
    end

end

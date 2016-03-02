# == Schema Information
#
# Table name: assignments
#
#  id           :integer          not null, primary key
#  shift_id     :integer
#  user_id      :integer
#  end_time     :datetime
#  reason       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  location_id  :integer
#

class AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  # GET /assignments
  # GET /assignments.json
  def index
    @assignment = Assignment.new
    @assignments = Assignment.all.order(:location_id)
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to assignments_url, notice: 'Punched In Successfully.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Punched Out Successfully.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:shift_id, :user_id, :location_id, :utf8, :authenticity_token)
    end

    def assign_to_shift
      latest_shift = Shift.last
      Shift.create if latest_shift == nil || latest_shift.end_time != nil
      Shift.last.id
    end
    helper_method :assign_to_shift
end

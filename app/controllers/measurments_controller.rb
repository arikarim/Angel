class MeasurmentsController < ApplicationController
  before_action :set_measurment, only: %i[show update destroy]

  # GET /measurments
  def index
    @measurments = Measurment.all

    render json: @measurments
  end

  # GET /measurments/1
  def show
    render json: @measurment
  end

  # POST /measurments
  def create
    @measurment = Measurment.new(measurment_params)

    if @measurment.save
      render json: @measurment, status: :created, location: @measurment
    else
      render json: @measurment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /measurments/1
  def update
    if @measurment.update(measurment_params)
      render json: @measurment
    else
      render json: @measurment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /measurments/1
  def destroy
    @measurment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_measurment
    @measurment = Measurment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def measurment_params
    params.require(:measurment).permit(:number, :date, :user_id, :measure_id)
  end
end

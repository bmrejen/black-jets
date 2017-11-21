class FlightsController < ApplicationController
  def index
    @flights = Flight.where(
      origin: params[:origin],
      destination: params[:destination],
      departure: params[:departure],
    )
  end

  def new
    @flight = Flight.new
    @jets = current_user.jets
  end

  def create
    @flight = flight.new(flight_params)
    @flight.save
    redirect_to root_path
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy
  end

  private
    def flight_params
      params.require(:flight).permit(:name)
    end
end

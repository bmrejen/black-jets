class JetsController < ApplicationController
  # def index
  #   @jets = Jet.all
  # end
  # def edit
  #   @jet = Jet.find(params[:id])
  # end

  # def update
  #   @jet = Jet.find(params[:id])
  #   @jet.update(jet_params)
  #   redirect_to jet_path(@jet)
  # end

  def new
    @jet = Jet.new
  end

  def create
    @jet = Jet.new(jet_params)
    @jet.user_id = current_user.id
    current_user.jet_owner = true
    @jet.save
    redirect_to root_path
  end

  def destroy
    @jet = Jet.find(params[:id])
    @jet.destroy
    redirect_to jets_path
  end

  # def show
  #   @jet = Jet.find(params[:id])
  # end

  private
  def jet_params
    params.require(:jet).permit(:user_id, :plane_model, :seat_number, :production_year, :wifi, :meal, :description, photos: [])
  end


end

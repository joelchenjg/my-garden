class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
    @plants = @garden.plants
    @plant = Plant.new
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to @garden
    else
      render :new
    end
  end

private

  def garden_params
    params.require(:garden).permit(:name, :banner_url)
  end
end

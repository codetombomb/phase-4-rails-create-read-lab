class PlantsController < ApplicationController
  def index
    @plants = Plant.all
    render json: @plants
  end

  def show
    @plant = Plant.find(params[:id])
    if @plant
      render json: @plant
    else
      render json: { error: "Plant not found" }
    end
  end

  def create
    @plant = Plant.new(name: params[:name], image: params[:image], price: params[:price])
    if @plant.save
      render json: @plant, status: :created
    else
      render json: { error: @plant.errors.full_messages}
    end
  end

  # private

  # def plant_params
  #   params.require(:plant).permit(:name, :image, :price)
  # end
end

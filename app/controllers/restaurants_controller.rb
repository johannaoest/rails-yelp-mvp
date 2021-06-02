class RestaurantsController < ApplicationController

  def index
    p @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was sucessfully created.'
    else
      render 'new.html.erb'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :stars)
  end
end

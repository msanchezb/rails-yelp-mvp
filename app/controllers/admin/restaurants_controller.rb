class Admin::RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:update, :destroy, :edit]
  def edit
  end

  def index
    @restaurants = Restaurant.all
  end

  def update
    @restaurant.update(restaurant_params)
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end

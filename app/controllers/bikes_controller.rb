class BikesController < ApplicationController
  include BikesHelper

  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find_by(id: params[:id])
    @category = @bike.category
    @brand = @bike.brand
    @stocks = check_bike_stock(@bike)
  end
end

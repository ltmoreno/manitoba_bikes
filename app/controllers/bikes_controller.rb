class BikesController < ApplicationController
  include BikesHelper

  def index
    @bikes = Bike.all.page params[:page]
  end

  def show
    @bike = Bike.find_by(id: params[:id])
    @category = @bike.category
    @brand = @bike.brand
    @stocks = check_bike_stock(@bike)
  end

  def filter
    @category = Category.where(name: params[:category]).first
    @search_term = params[:search]

    @bikes = Bike.all
    @bikes = @category.present? ? @bikes.where(category: @category) : @bikes
    #@bikes = @bikes.where(category: @category) if @category.present?
    @bikes = @bikes.where('model LIKE ? OR description like ?', "%#{@search_term}%", "%#{@search_term}%") if @search_term.present?
    @bikes = @bikes.page params[:page]
  end
end
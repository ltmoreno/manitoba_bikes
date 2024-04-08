class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @brands = Brand.all
    @category = Category.find_by("LOWER(name) = ?", "#{params[:id].downcase}")
    @bikes = @category.bikes.page params[:page]
  end
end

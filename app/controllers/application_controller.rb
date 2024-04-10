class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart
  helper_method :item_quantity

  def initialize_session
    session[:shopping_cart] ||= {}
  end

  def cart
    Bike.find(session[:shopping_cart].keys)
  end

  def item_quantity(id)
    session[:shopping_cart][id.to_s]
  end
end

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


  # devise parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :lastname, :address, :province_id, :password_confirmation])
  end
end

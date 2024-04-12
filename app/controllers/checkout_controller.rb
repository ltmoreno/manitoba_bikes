class CheckoutController < ApplicationController
  def index
    unless customer_signed_in?
      flash[:notice] = "You need to singin to proceed with the checkout."
      redirect_to customer_session_path
    end
  end
end
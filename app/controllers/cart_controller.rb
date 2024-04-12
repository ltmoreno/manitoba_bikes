class CartController < ApplicationController
  def create ()
    id = params[:id].to_i

    session[:shopping_cart][id.to_s] ||= 0
    session[:shopping_cart][id.to_s] += 1 # add one to the count for this id
    bike = Bike.find(id)
    flash[:notice] = "✚ #{bike.brand.name} #{bike.model} added to cart."
    redirect_back_or_to root_path
  end

  def update
    id = params[:id].to_i

    url = Rails.application.routes.recognize_path(request.referrer)
    last_controller = url[:controller]

    session[:shopping_cart][id.to_s] ||= 0
    if params[:button_type] == 'decrement'
      # Handle decrement logic here
      if session[:shopping_cart][id.to_s] > 1
        session[:shopping_cart][id.to_s] -= 1


      else
        session[:shopping_cart].delete(id.to_s)
        bike = Bike.find(id)
        flash[:notice] = "− #{bike.brand.name} #{bike.model} removed from cart."

        if(last_controller =="checkout")
          redirect_to checkout_index_path
        else
          redirect_back_or_to root_path
        end
      end
    elsif params[:button_type] == 'increment'
      # Handle increment logic here
      session[:shopping_cart][id.to_s] += 1
    end

    if(last_controller =="checkout")
      redirect_to checkout_index_path
    end
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id.to_s)
    logger.debug(id)
    #session[:shopping_cart][id.to_s] -= 1 # add one to the count for this id
    bike = Bike.find(id)
    flash[:notice] = "− #{bike.brand.name} #{bike.model} removed from cart...."
    redirect_back_or_to root_path
  end
end
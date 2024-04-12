class CheckoutController < ApplicationController
  include CheckoutHelper

  def index
    if session[:shopping_cart].size == 0
      flash[:notice] = "Shopping cart is empty."
      redirect_to root_path
    end

    unless customer_signed_in?
      flash[:notice] = "You need to singin to proceed with the checkout."
      redirect_to customer_session_path
    end
  end

  def create
    province = current_customer.province

    order = Order.create(
      customer: current_customer,
      full_address: current_customer.full_address,
      gst: province.gst,
      pst: province.pst,
      hst: province.hst,
      status: "new",
    )

    if order&.valid?
      session[:oid] = order.id
      cart.each do |bike|
        bike_order = order.bike_orders.create(
          bike: bike,
          quantity: item_quantity(bike.id),
          unit_price: bike.price
        )
      end
    end

    charges = []
    cart.each do |bike|
      bike = Bike.find(bike.id)
      charges.push(name: "#{bike.brand.name} #{bike.model}", unit_amount: (bike.price * 100).round, quantity: item_quantity(bike.id))
    end

    if gst > 0
      charges.push(name: "GST", unit_amount: (gst * 100).round, quantity: 1)
    end

    if pst > 0
      charges.push(name: "PST", unit_amount: (pst * 100).round, quantity: 1)
    end

    if hst > 0
      charges.push(name: "GST", unit_amount: (hst * 100).round, quantity: 1)
    end

    line_items = charges.map do |charge|
      {
        price_data: {
          currency: 'cad',
          product_data: {
            name: charge[:name],
          },
          unit_amount: charge[:unit_amount],
        },
        quantity: charge[:quantity],
      }
    end

    customer = Stripe::Customer.create({
      name: current_customer.fullname,
      email: params[:stripeEmail],
      description: "Customer id: #{current_customer.id}",
      source: params[:stripeToken],
    })

    session = Stripe::Checkout::Session.create({
      customer: customer,
      payment_method_types: ['card'],
      metadata: {'order_id' => order.id},
      line_items: line_items,
      mode: 'payment',
      success_url:  checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url
    })

    redirect_to session.url, allow_other_host: true
  end

  def success
    #handle successful payments
    session[:shopping_cart] = {}
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    order = Order.find(session[:oid])
    order.update(status: "paid")

  end

  def cancel
    #handle if the payment is cancelled
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @reason = "Payment not successful. Status: #{@payment_intent.status}"

    order = Order.find(session[:oid])
    order.update(status: "cancelled")
  end
end
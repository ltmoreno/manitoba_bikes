module CheckoutHelper
  def cart_subtotal
    subtotal = 0
    cart.each do |bike|
      subtotal += bike.price * item_quantity(bike.id).to_i
    end

    subtotal
  end

  def cart_total
    gst = current_customer.province.gst? ? current_customer.province.gst * cart_subtotal : 0
    pst = current_customer.province.pst? ? current_customer.province.pst * cart_subtotal : 0
    hst = current_customer.province.hst? ? current_customer.province.hst * cart_subtotal : 0

    # Here is the total tax to be charged
    cart_subtotal + gst + pst + hst
  end
end

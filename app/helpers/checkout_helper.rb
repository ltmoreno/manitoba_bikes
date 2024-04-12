module CheckoutHelper
  def cart_subtotal
    subtotal = 0
    cart.each do |bike|
      subtotal += bike.price * item_quantity(bike.id).to_i
    end

    subtotal
  end

  def gst
    current_customer.province.gst? ? current_customer.province.gst * cart_subtotal : 0
  end

  def pst
    pst = current_customer.province.pst? ? current_customer.province.pst * cart_subtotal : 0
  end

  def hst
    hst = current_customer.province.hst? ? current_customer.province.hst * cart_subtotal : 0
  end

  def cart_total
    cart_subtotal + gst + pst + hst
  end
end

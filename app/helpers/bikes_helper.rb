module BikesHelper
  def check_bike_stock(bike)
    bike.bike_shipments.all.sum(:quantity) - bike.bike_orders.all.sum(:quantity)
  end
end

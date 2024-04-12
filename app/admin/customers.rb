ActiveAdmin.register Customer do
  show do
    attributes_table do
      row :fullname, label: "Name"
      row :address
      row :email
      row :province
    end

    panel "Bike Orders" do
      table_for customer.bike_orders.includes(:bike) do
        column "" do |bike_order|
          image_tag url_for(bike_order.bike.photo.variant(:thumb))
        end
        column "Brand and Model" do |bike_order|
          "#{bike_order.bike.brand.name} #{bike_order.bike.model}"
        end
        column :order_id
        column :created_at, label: "Date"
        column :quantity,label: "Items"
        column :status do |bike_order|
          bike_order.order.status
        end
        column :unit_price do |bike_order|
          number_to_currency(bike_order.unit_price)
        end
        column :gst do |bike_order|
          number_to_percentage(bike_order.order.gst)
        end
        column :pst do |bike_order|
          number_to_percentage(bike_order.order.pst)
        end
        column :hst do |bike_order|
          number_to_percentage(bike_order.order.hst)
        end
        column "Delivered t" do |bike_order|
          bike_order.order.full_address
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column "Name", :fullname
    column :email
    column :province
    actions
  end
end

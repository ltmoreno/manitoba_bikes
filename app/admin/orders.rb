ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #permit_params :customer_id, :date, :full_address, :gst, :pst, :hst, :status
  permit_params  :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id, :date, :full_address, :gst, :pst, :hst, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  show do
    attributes_table do
      row :gst
      row :pst
      row :hst
      row :status
      row :full_address, label: "shipping_address"
      row :created_at
      row :updated_at
      # other order attributes
    end

    panel "Customer" do
      table_for order.customer do
        column :fullname
        column :full_address
        column :email
      end
    end

    panel "Bikes" do
      table_for order.bike_orders.includes(:bike) do
        column "Model" do |bike_order|
          bike_order.bike.model
        end
        column :unit_price
        column :quantity
        # other product attributes you wish to display
      end
    end
  end
end

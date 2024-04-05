ActiveAdmin.register Bike do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :brand_id, :model, :category_id, :color, :price, :description

  actions :all, except: []

  #
  # or
  #
  # permit_params do
  #   permitted = [:brand_id, :model, :category_id, :color, :price, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end

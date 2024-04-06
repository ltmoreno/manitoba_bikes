ActiveAdmin.register Bike do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :brand_id, :model, :category_id, :color, :price, :description, :photo

  actions :all, except: []

  filter :brand
  filter :category
  filter :price

  index do
    selectable_column
    id_column
    column :brand
    column :model
    column :photo do |p|
      image_tag url_for(p.photo), height: 56
    end
  end

  form do |f|
    f.inputs do
      f.input :brand
      f.input :category
      f.input :model
      f.input :color
      f.input :price
      f.input :description
      f.input :photo, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :brand
      row :category
      row :model
      row :price
      row :description
      row :photo do |p|
        image_tag url_for(p.photo), width:450
      end
    end
  end
end

class ChangeProvinceColumnType < ActiveRecord::Migration[7.1]
  def change
    remove_column :provinces, :type, :string
    add_column :provinces, :tax_type, :string
  end
end

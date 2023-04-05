class AddFiltersToEachMenuItem < ActiveRecord::Migration[7.0]
  def change
    add_column :menus, :hasGluten, :integer, default: 0
    add_column :menus, :isVegan, :integer, default: 0
    add_column :menus, :isHalal, :integer, default: 0
  end
end

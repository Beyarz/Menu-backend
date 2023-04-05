class ConvertCoordToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :menus, :lat, :float
    change_column :menus, :lon, :float
  end
end

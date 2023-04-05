class AddLongLatToMenu < ActiveRecord::Migration[7.0]
  def change
    add_column :menus, :lon, :integer
    add_column :menus, :lat, :integer
  end
end

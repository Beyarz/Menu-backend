# frozen_string_literal: true

class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.text :restaurant
      t.text :description
      t.text :dish
      t.text :ethnic_category
      t.text :ingredient
      t.integer :rating

      t.timestamps
    end
  end
end

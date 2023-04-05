# frozen_string_literal: true

require "faker"

# New York, Times square
# STATIC_LONG = -73.98591613769531
# STATIC_LAT = 40.75740432739258

100.times do
  Menu.create!(
    restaurant: Faker::Restaurant.name,
    description: Faker::Food.description,
    dish: Faker::Food.dish,
    ethnic_category: Faker::Food.ethnic_category,
    ingredient: Faker::Food.ingredient,
    rating: rand(1..5),
    hasGluten: rand(0..1),
    isVegan: rand(0..1),
    isHalal: rand(0..1),
    price: rand(70..500),
    # lat: STATIC_LAT + rand(0.1..1),
    # long: STATIC_LONG + rand(0.1..1),
    lat: rand(1.0..10.0),
    lon: rand(1.0..10.0),
  )
end

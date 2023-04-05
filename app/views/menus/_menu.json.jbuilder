# frozen_string_literal: true

json.restaurant menu["restaurant"]
json.description menu["description"]
json.dish menu["dish"]
json.ethnic_category menu["ethnic_category"]
json.ingredient menu["ingredient"]
json.rating menu["rating"]
json.hasGluten menu["hasGluten"]
json.isVegan menu["isVegan"]
json.isHalal menu["isHalal"]
json.price menu["price"]

json.coord do
	json.lat menu["lat"]
	json.lon menu["lon"]
end

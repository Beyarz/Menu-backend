# frozen_string_literal: true

@stats = "Loaded #{@menus.total_count.to_i > @limit.to_i ? @limit : @menus.total_count} #{@menus.total_count > 1 ? 'items' : 'item' } in #{@menus.took} ms"
@prices = @menus.map { |menu| menu["price"] }
@ratings = @menus.map { |menu| menu["rating"] }

json.result do
  json.menus do
    json.array! @menus do |menu|
      json.partial! "menus/menu", menu:
    end
  end
  json.meta do
    json.statistics @stats
    json.computed do
      json.minRating @ratings.min
      json.maxRating @ratings.max
      json.minPrice @prices.min
      json.maxPrice @prices.max
      json.page @page.to_i
      json.offset @offset.to_i
      json.limit @limit.to_i
    end
  end
end

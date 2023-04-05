# frozen_string_literal: true

class MenusController < ApplicationController
  # @route GET /search/:query {format: :json}
  def search
    query = Menu.sanitize_sql_like(params[:query])

    @chosenMinPrice = params[:minPrice]
    @chosenMaxPrice = params[:maxPrice]
    @chosenMinRating = params[:minRating]
    @chosenMaxRating = params[:maxRating]
    @hasGluten = params[:hasGluten]
    @isVegan = params[:isVegan]
    @isHalal = params[:isHalal]
    @lat = params[:lat]
    @lon = params[:lon]

    @radius = params[:radius] || "100km"
    @page = params[:page] || 0
    @offset = params[:pageKey] || 0
    @limit = params[:pageSize] || 10

    sort_by_location = (@lat.blank? or @lon.blank?) ? {
        location: nil
      } : {
        location: {
          near: [@lat.to_f, @lon.to_f],
          within: @radius,
        }
      }

    # gte, greater than or equal
    # lte, less than or equal
    @menus = Menu.search(
      query,
      where: {
        price: {
          gte: @chosenMinPrice,
          lte: @chosenMaxPrice,
        },
        rating: {
          gte: @chosenMinRating,
          lte: @chosenMaxRating,
        },
        hasGluten: @hasGluten,
        isVegan: @isVegan,
        isHalal: @isHalal,
        **sort_by_location,
      }.compact,
      **search_config(@page, @offset, @limit)
    )

    if @menus.empty?
      render :not_found, status: :not_found
    else
      render :response, status: :ok
    end
  end

  # @route GET / {format: :json} (root)
  # @route GET /menus {format: :json} (menus)
  def index
    @page = params[:page] || 0
    @offset = params[:pageKey] || 0
    @limit = params[:pageSize] || 10

    @menus = Menu.search(
      "*",
      **search_config(@page, @offset, @limit)
    )
    render :response, status: :ok
  end

  private
  def search_config(page = 0, offset = 0, limit = 10)
    {
      page:,
      offset:,
      limit:,
      per_page: limit,

      # Avoid short queries
      body_options: { min_score: 1 }
    }
  end
end

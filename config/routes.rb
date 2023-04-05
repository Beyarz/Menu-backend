# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  defaults format: :json do
    root to: "menus#index"
    resources :menus, only: [:index]
    get "search", to: "menus#index"
    get "search/:query", to: "menus#search"
  end
end

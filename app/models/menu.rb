# frozen_string_literal: true

# == Schema Information
#
# Table name: menus
#
#  id              :integer          not null, primary key
#  description     :text
#  dish            :text
#  ethnic_category :text
#  hasGluten       :integer          default(0)
#  ingredient      :text
#  isHalal         :integer          default(0)
#  isVegan         :integer          default(0)
#  lat             :float
#  lon             :float
#  price           :integer
#  rating          :integer
#  restaurant      :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Menu < ApplicationRecord
  searchkick locations: [:location]
  after_commit :reindex_menu

  MenuReindexJob.set(wait_until: Date.tomorrow.noon).perform_later

  def reindex_menu
    self.reindex
  end

  def search_data
    {
      restaurant:,
      description:,
      dish:,
      ethnic_category:,
      ingredient:,
      rating:,
      hasGluten:,
      isVegan:,
      isHalal:,
      price:,
      lat:,
      lon:,
    }.merge(
      location: ['lat', 'lon']
    )
  end
end

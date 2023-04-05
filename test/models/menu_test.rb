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
require "test_helper"

class MenuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

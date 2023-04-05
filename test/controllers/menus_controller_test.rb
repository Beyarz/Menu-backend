# frozen_string_literal: true

require "test_helper"

class MenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu = menus(:one)
  end

  test "should get index" do
    get menus_url, as: :json
    assert_response :ok
  end

  test "should get ok from search" do
    get search_url(), as: :json
    assert_response :ok
  end

  test "should get not_found from search" do
    get menus_url(), as: :json
    assert_response :not_found
  end
end

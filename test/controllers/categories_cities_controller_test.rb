require 'test_helper'

class CategoriesCitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categories_city = categories_cities(:one)
  end

  test "should get index" do
    get categories_cities_url
    assert_response :success
  end

  test "should get new" do
    get new_categories_city_url
    assert_response :success
  end

  test "should create categories_city" do
    assert_difference('CategoriesCity.count') do
      post categories_cities_url, params: { categories_city: { category_id: @categories_city.category_id, city_id: @categories_city.city_id, status: @categories_city.status } }
    end

    assert_redirected_to categories_city_url(CategoriesCity.last)
  end

  test "should show categories_city" do
    get categories_city_url(@categories_city)
    assert_response :success
  end

  test "should get edit" do
    get edit_categories_city_url(@categories_city)
    assert_response :success
  end

  test "should update categories_city" do
    patch categories_city_url(@categories_city), params: { categories_city: { category_id: @categories_city.category_id, city_id: @categories_city.city_id, status: @categories_city.status } }
    assert_redirected_to categories_city_url(@categories_city)
  end

  test "should destroy categories_city" do
    assert_difference('CategoriesCity.count', -1) do
      delete categories_city_url(@categories_city)
    end

    assert_redirected_to categories_cities_url
  end
end

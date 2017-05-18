require 'test_helper'

class ProductsCitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @products_city = products_cities(:one)
  end

  test "should get index" do
    get products_cities_url
    assert_response :success
  end

  test "should get new" do
    get new_products_city_url
    assert_response :success
  end

  test "should create products_city" do
    assert_difference('ProductsCity.count') do
      post products_cities_url, params: { products_city: { categories_city_id: @products_city.categories_city_id, product_id: @products_city.product_id, status: @products_city.status } }
    end

    assert_redirected_to products_city_url(ProductsCity.last)
  end

  test "should show products_city" do
    get products_city_url(@products_city)
    assert_response :success
  end

  test "should get edit" do
    get edit_products_city_url(@products_city)
    assert_response :success
  end

  test "should update products_city" do
    patch products_city_url(@products_city), params: { products_city: { categories_city_id: @products_city.categories_city_id, product_id: @products_city.product_id, status: @products_city.status } }
    assert_redirected_to products_city_url(@products_city)
  end

  test "should destroy products_city" do
    assert_difference('ProductsCity.count', -1) do
      delete products_city_url(@products_city)
    end

    assert_redirected_to products_cities_url
  end
end

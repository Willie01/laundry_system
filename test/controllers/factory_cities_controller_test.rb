require 'test_helper'

class FactoryCitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @factory_city = factory_cities(:one)
  end

  test "should get index" do
    get factory_cities_url
    assert_response :success
  end

  test "should get new" do
    get new_factory_city_url
    assert_response :success
  end

  test "should create factory_city" do
    assert_difference('FactoryCity.count') do
      post factory_cities_url, params: { factory_city: { city_id: @factory_city.city_id, latitude: @factory_city.latitude, longitude: @factory_city.longitude, status: @factory_city.status } }
    end

    assert_redirected_to factory_city_url(FactoryCity.last)
  end

  test "should show factory_city" do
    get factory_city_url(@factory_city)
    assert_response :success
  end

  test "should get edit" do
    get edit_factory_city_url(@factory_city)
    assert_response :success
  end

  test "should update factory_city" do
    patch factory_city_url(@factory_city), params: { factory_city: { city_id: @factory_city.city_id, latitude: @factory_city.latitude, longitude: @factory_city.longitude, status: @factory_city.status } }
    assert_redirected_to factory_city_url(@factory_city)
  end

  test "should destroy factory_city" do
    assert_difference('FactoryCity.count', -1) do
      delete factory_city_url(@factory_city)
    end

    assert_redirected_to factory_cities_url
  end
end

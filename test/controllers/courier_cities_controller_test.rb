require 'test_helper'

class CourierCitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courier_city = courier_cities(:one)
  end

  test "should get index" do
    get courier_cities_url
    assert_response :success
  end

  test "should get new" do
    get new_courier_city_url
    assert_response :success
  end

  test "should create courier_city" do
    assert_difference('CourierCity.count') do
      post courier_cities_url, params: { courier_city: { city_id: @courier_city.city_id, latitude: @courier_city.latitude, longitude: @courier_city.longitude, status: @courier_city.status } }
    end

    assert_redirected_to courier_city_url(CourierCity.last)
  end

  test "should show courier_city" do
    get courier_city_url(@courier_city)
    assert_response :success
  end

  test "should get edit" do
    get edit_courier_city_url(@courier_city)
    assert_response :success
  end

  test "should update courier_city" do
    patch courier_city_url(@courier_city), params: { courier_city: { city_id: @courier_city.city_id, latitude: @courier_city.latitude, longitude: @courier_city.longitude, status: @courier_city.status } }
    assert_redirected_to courier_city_url(@courier_city)
  end

  test "should destroy courier_city" do
    assert_difference('CourierCity.count', -1) do
      delete courier_city_url(@courier_city)
    end

    assert_redirected_to courier_cities_url
  end
end

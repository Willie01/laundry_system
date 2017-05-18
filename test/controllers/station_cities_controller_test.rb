require 'test_helper'

class StationCitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @station_city = station_cities(:one)
  end

  test "should get index" do
    get station_cities_url
    assert_response :success
  end

  test "should get new" do
    get new_station_city_url
    assert_response :success
  end

  test "should create station_city" do
    assert_difference('StationCity.count') do
      post station_cities_url, params: { station_city: { city_id: @station_city.city_id, latitude: @station_city.latitude, longitude: @station_city.longitude, status: @station_city.status } }
    end

    assert_redirected_to station_city_url(StationCity.last)
  end

  test "should show station_city" do
    get station_city_url(@station_city)
    assert_response :success
  end

  test "should get edit" do
    get edit_station_city_url(@station_city)
    assert_response :success
  end

  test "should update station_city" do
    patch station_city_url(@station_city), params: { station_city: { city_id: @station_city.city_id, latitude: @station_city.latitude, longitude: @station_city.longitude, status: @station_city.status } }
    assert_redirected_to station_city_url(@station_city)
  end

  test "should destroy station_city" do
    assert_difference('StationCity.count', -1) do
      delete station_city_url(@station_city)
    end

    assert_redirected_to station_cities_url
  end
end

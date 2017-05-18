require 'test_helper'

class CourierStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courier_station = courier_stations(:one)
  end

  test "should get index" do
    get courier_stations_url
    assert_response :success
  end

  test "should get new" do
    get new_courier_station_url
    assert_response :success
  end

  test "should create courier_station" do
    assert_difference('CourierStation.count') do
      post courier_stations_url, params: { courier_station: { courier_id: @courier_station.courier_id, station_id: @courier_station.station_id, status: @courier_station.status } }
    end

    assert_redirected_to courier_station_url(CourierStation.last)
  end

  test "should show courier_station" do
    get courier_station_url(@courier_station)
    assert_response :success
  end

  test "should get edit" do
    get edit_courier_station_url(@courier_station)
    assert_response :success
  end

  test "should update courier_station" do
    patch courier_station_url(@courier_station), params: { courier_station: { courier_id: @courier_station.courier_id, station_id: @courier_station.station_id, status: @courier_station.status } }
    assert_redirected_to courier_station_url(@courier_station)
  end

  test "should destroy courier_station" do
    assert_difference('CourierStation.count', -1) do
      delete courier_station_url(@courier_station)
    end

    assert_redirected_to courier_stations_url
  end
end

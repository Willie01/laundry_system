require 'test_helper'

class StationFactoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @station_factory = station_factories(:one)
  end

  test "should get index" do
    get station_factories_url
    assert_response :success
  end

  test "should get new" do
    get new_station_factory_url
    assert_response :success
  end

  test "should create station_factory" do
    assert_difference('StationFactory.count') do
      post station_factories_url, params: { station_factory: { factory_id: @station_factory.factory_id, station_id: @station_factory.station_id, status: @station_factory.status } }
    end

    assert_redirected_to station_factory_url(StationFactory.last)
  end

  test "should show station_factory" do
    get station_factory_url(@station_factory)
    assert_response :success
  end

  test "should get edit" do
    get edit_station_factory_url(@station_factory)
    assert_response :success
  end

  test "should update station_factory" do
    patch station_factory_url(@station_factory), params: { station_factory: { factory_id: @station_factory.factory_id, station_id: @station_factory.station_id, status: @station_factory.status } }
    assert_redirected_to station_factory_url(@station_factory)
  end

  test "should destroy station_factory" do
    assert_difference('StationFactory.count', -1) do
      delete station_factory_url(@station_factory)
    end

    assert_redirected_to station_factories_url
  end
end

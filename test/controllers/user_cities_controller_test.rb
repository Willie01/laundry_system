require 'test_helper'

class UserCitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_city = user_cities(:one)
  end

  test "should get index" do
    get user_cities_url
    assert_response :success
  end

  test "should get new" do
    get new_user_city_url
    assert_response :success
  end

  test "should create user_city" do
    assert_difference('UserCity.count') do
      post user_cities_url, params: { user_city: { city_id: @user_city.city_id, latitude: @user_city.latitude, longitude: @user_city.longitude, status: @user_city.status } }
    end

    assert_redirected_to user_city_url(UserCity.last)
  end

  test "should show user_city" do
    get user_city_url(@user_city)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_city_url(@user_city)
    assert_response :success
  end

  test "should update user_city" do
    patch user_city_url(@user_city), params: { user_city: { city_id: @user_city.city_id, latitude: @user_city.latitude, longitude: @user_city.longitude, status: @user_city.status } }
    assert_redirected_to user_city_url(@user_city)
  end

  test "should destroy user_city" do
    assert_difference('UserCity.count', -1) do
      delete user_city_url(@user_city)
    end

    assert_redirected_to user_cities_url
  end
end

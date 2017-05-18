require 'test_helper'

class CouponCitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupon_city = coupon_cities(:one)
  end

  test "should get index" do
    get coupon_cities_url
    assert_response :success
  end

  test "should get new" do
    get new_coupon_city_url
    assert_response :success
  end

  test "should create coupon_city" do
    assert_difference('CouponCity.count') do
      post coupon_cities_url, params: { coupon_city: { city: @coupon_city.city, coupon_id: @coupon_city.coupon_id, start_on: @coupon_city.start_on, status: @coupon_city.status } }
    end

    assert_redirected_to coupon_city_url(CouponCity.last)
  end

  test "should show coupon_city" do
    get coupon_city_url(@coupon_city)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupon_city_url(@coupon_city)
    assert_response :success
  end

  test "should update coupon_city" do
    patch coupon_city_url(@coupon_city), params: { coupon_city: { city: @coupon_city.city, coupon_id: @coupon_city.coupon_id, start_on: @coupon_city.start_on, status: @coupon_city.status } }
    assert_redirected_to coupon_city_url(@coupon_city)
  end

  test "should destroy coupon_city" do
    assert_difference('CouponCity.count', -1) do
      delete coupon_city_url(@coupon_city)
    end

    assert_redirected_to coupon_cities_url
  end
end

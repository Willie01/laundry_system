require 'test_helper'

class CouponruleCitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @couponrule_city = couponrule_cities(:one)
  end

  test "should get index" do
    get couponrule_cities_url
    assert_response :success
  end

  test "should get new" do
    get new_couponrule_city_url
    assert_response :success
  end

  test "should create couponrule_city" do
    assert_difference('CouponruleCity.count') do
      post couponrule_cities_url, params: { couponrule_city: { city: @couponrule_city.city, coupon_id: @couponrule_city.coupon_id, end_on: @couponrule_city.end_on, start_on: @couponrule_city.start_on, status: @couponrule_city.status } }
    end

    assert_redirected_to couponrule_city_url(CouponruleCity.last)
  end

  test "should show couponrule_city" do
    get couponrule_city_url(@couponrule_city)
    assert_response :success
  end

  test "should get edit" do
    get edit_couponrule_city_url(@couponrule_city)
    assert_response :success
  end

  test "should update couponrule_city" do
    patch couponrule_city_url(@couponrule_city), params: { couponrule_city: { city: @couponrule_city.city, coupon_id: @couponrule_city.coupon_id, end_on: @couponrule_city.end_on, start_on: @couponrule_city.start_on, status: @couponrule_city.status } }
    assert_redirected_to couponrule_city_url(@couponrule_city)
  end

  test "should destroy couponrule_city" do
    assert_difference('CouponruleCity.count', -1) do
      delete couponrule_city_url(@couponrule_city)
    end

    assert_redirected_to couponrule_cities_url
  end
end

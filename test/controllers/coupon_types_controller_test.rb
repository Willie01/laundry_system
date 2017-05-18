require 'test_helper'

class CouponTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupon_type = coupon_types(:one)
  end

  test "should get index" do
    get coupon_types_url
    assert_response :success
  end

  test "should get new" do
    get new_coupon_type_url
    assert_response :success
  end

  test "should create coupon_type" do
    assert_difference('CouponType.count') do
      post coupon_types_url, params: { coupon_type: { coupon_type_name: @coupon_type.coupon_type_name } }
    end

    assert_redirected_to coupon_type_url(CouponType.last)
  end

  test "should show coupon_type" do
    get coupon_type_url(@coupon_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupon_type_url(@coupon_type)
    assert_response :success
  end

  test "should update coupon_type" do
    patch coupon_type_url(@coupon_type), params: { coupon_type: { coupon_type_name: @coupon_type.coupon_type_name } }
    assert_redirected_to coupon_type_url(@coupon_type)
  end

  test "should destroy coupon_type" do
    assert_difference('CouponType.count', -1) do
      delete coupon_type_url(@coupon_type)
    end

    assert_redirected_to coupon_types_url
  end
end

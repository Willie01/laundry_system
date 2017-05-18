require 'test_helper'

class CouponCoupontypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupon_coupontype = coupon_coupontypes(:one)
  end

  test "should get index" do
    get coupon_coupontypes_url
    assert_response :success
  end

  test "should get new" do
    get new_coupon_coupontype_url
    assert_response :success
  end

  test "should create coupon_coupontype" do
    assert_difference('CouponCoupontype.count') do
      post coupon_coupontypes_url, params: { coupon_coupontype: { coupon_id: @coupon_coupontype.coupon_id, coupon_type_id: @coupon_coupontype.coupon_type_id, status: @coupon_coupontype.status } }
    end

    assert_redirected_to coupon_coupontype_url(CouponCoupontype.last)
  end

  test "should show coupon_coupontype" do
    get coupon_coupontype_url(@coupon_coupontype)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupon_coupontype_url(@coupon_coupontype)
    assert_response :success
  end

  test "should update coupon_coupontype" do
    patch coupon_coupontype_url(@coupon_coupontype), params: { coupon_coupontype: { coupon_id: @coupon_coupontype.coupon_id, coupon_type_id: @coupon_coupontype.coupon_type_id, status: @coupon_coupontype.status } }
    assert_redirected_to coupon_coupontype_url(@coupon_coupontype)
  end

  test "should destroy coupon_coupontype" do
    assert_difference('CouponCoupontype.count', -1) do
      delete coupon_coupontype_url(@coupon_coupontype)
    end

    assert_redirected_to coupon_coupontypes_url
  end
end

require 'test_helper'

class CouponStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupon_status = coupon_statuses(:one)
  end

  test "should get index" do
    get coupon_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_coupon_status_url
    assert_response :success
  end

  test "should create coupon_status" do
    assert_difference('CouponStatus.count') do
      post coupon_statuses_url, params: { coupon_status: { coupon_status_name: @coupon_status.coupon_status_name } }
    end

    assert_redirected_to coupon_status_url(CouponStatus.last)
  end

  test "should show coupon_status" do
    get coupon_status_url(@coupon_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupon_status_url(@coupon_status)
    assert_response :success
  end

  test "should update coupon_status" do
    patch coupon_status_url(@coupon_status), params: { coupon_status: { coupon_status_name: @coupon_status.coupon_status_name } }
    assert_redirected_to coupon_status_url(@coupon_status)
  end

  test "should destroy coupon_status" do
    assert_difference('CouponStatus.count', -1) do
      delete coupon_status_url(@coupon_status)
    end

    assert_redirected_to coupon_statuses_url
  end
end

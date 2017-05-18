require 'test_helper'

class CouponsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupons_user = coupons_users(:one)
  end

  test "should get index" do
    get coupons_users_url
    assert_response :success
  end

  test "should get new" do
    get new_coupons_user_url
    assert_response :success
  end

  test "should create coupons_user" do
    assert_difference('CouponsUser.count') do
      post coupons_users_url, params: { coupons_user: { status: @coupons_user.status, user_id: @coupons_user.user_id } }
    end

    assert_redirected_to coupons_user_url(CouponsUser.last)
  end

  test "should show coupons_user" do
    get coupons_user_url(@coupons_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupons_user_url(@coupons_user)
    assert_response :success
  end

  test "should update coupons_user" do
    patch coupons_user_url(@coupons_user), params: { coupons_user: { status: @coupons_user.status, user_id: @coupons_user.user_id } }
    assert_redirected_to coupons_user_url(@coupons_user)
  end

  test "should destroy coupons_user" do
    assert_difference('CouponsUser.count', -1) do
      delete coupons_user_url(@coupons_user)
    end

    assert_redirected_to coupons_users_url
  end
end

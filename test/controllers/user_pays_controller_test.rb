require 'test_helper'

class UserPaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_pay = user_pays(:one)
  end

  test "should get index" do
    get user_pays_url
    assert_response :success
  end

  test "should get new" do
    get new_user_pay_url
    assert_response :success
  end

  test "should create user_pay" do
    assert_difference('UserPay.count') do
      post user_pays_url, params: { user_pay: { pay: @user_pay.pay, status: @user_pay.status, user_id: @user_pay.user_id } }
    end

    assert_redirected_to user_pay_url(UserPay.last)
  end

  test "should show user_pay" do
    get user_pay_url(@user_pay)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_pay_url(@user_pay)
    assert_response :success
  end

  test "should update user_pay" do
    patch user_pay_url(@user_pay), params: { user_pay: { pay: @user_pay.pay, status: @user_pay.status, user_id: @user_pay.user_id } }
    assert_redirected_to user_pay_url(@user_pay)
  end

  test "should destroy user_pay" do
    assert_difference('UserPay.count', -1) do
      delete user_pay_url(@user_pay)
    end

    assert_redirected_to user_pays_url
  end
end

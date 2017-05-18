require 'test_helper'

class PayStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pay_status = pay_statuses(:one)
  end

  test "should get index" do
    get pay_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_pay_status_url
    assert_response :success
  end

  test "should create pay_status" do
    assert_difference('PayStatus.count') do
      post pay_statuses_url, params: { pay_status: { pay_status_name: @pay_status.pay_status_name } }
    end

    assert_redirected_to pay_status_url(PayStatus.last)
  end

  test "should show pay_status" do
    get pay_status_url(@pay_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_pay_status_url(@pay_status)
    assert_response :success
  end

  test "should update pay_status" do
    patch pay_status_url(@pay_status), params: { pay_status: { pay_status_name: @pay_status.pay_status_name } }
    assert_redirected_to pay_status_url(@pay_status)
  end

  test "should destroy pay_status" do
    assert_difference('PayStatus.count', -1) do
      delete pay_status_url(@pay_status)
    end

    assert_redirected_to pay_statuses_url
  end
end

require 'test_helper'

class IncomeStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @income_status = income_statuses(:one)
  end

  test "should get index" do
    get income_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_income_status_url
    assert_response :success
  end

  test "should create income_status" do
    assert_difference('IncomeStatus.count') do
      post income_statuses_url, params: { income_status: { income_status_name: @income_status.income_status_name } }
    end

    assert_redirected_to income_status_url(IncomeStatus.last)
  end

  test "should show income_status" do
    get income_status_url(@income_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_income_status_url(@income_status)
    assert_response :success
  end

  test "should update income_status" do
    patch income_status_url(@income_status), params: { income_status: { income_status_name: @income_status.income_status_name } }
    assert_redirected_to income_status_url(@income_status)
  end

  test "should destroy income_status" do
    assert_difference('IncomeStatus.count', -1) do
      delete income_status_url(@income_status)
    end

    assert_redirected_to income_statuses_url
  end
end

require 'test_helper'

class LogisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @logistic = logistics(:one)
  end

  test "should get index" do
    get logistics_url
    assert_response :success
  end

  test "should get new" do
    get new_logistic_url
    assert_response :success
  end

  test "should create logistic" do
    assert_difference('Logistic.count') do
      post logistics_url, params: { logistic: { name: @logistic.name } }
    end

    assert_redirected_to logistic_url(Logistic.last)
  end

  test "should show logistic" do
    get logistic_url(@logistic)
    assert_response :success
  end

  test "should get edit" do
    get edit_logistic_url(@logistic)
    assert_response :success
  end

  test "should update logistic" do
    patch logistic_url(@logistic), params: { logistic: { name: @logistic.name } }
    assert_redirected_to logistic_url(@logistic)
  end

  test "should destroy logistic" do
    assert_difference('Logistic.count', -1) do
      delete logistic_url(@logistic)
    end

    assert_redirected_to logistics_url
  end
end

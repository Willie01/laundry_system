require 'test_helper'

class PriceTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price_type = price_types(:one)
  end

  test "should get index" do
    get price_types_url
    assert_response :success
  end

  test "should get new" do
    get new_price_type_url
    assert_response :success
  end

  test "should create price_type" do
    assert_difference('PriceType.count') do
      post price_types_url, params: { price_type: { name: @price_type.name } }
    end

    assert_redirected_to price_type_url(PriceType.last)
  end

  test "should show price_type" do
    get price_type_url(@price_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_price_type_url(@price_type)
    assert_response :success
  end

  test "should update price_type" do
    patch price_type_url(@price_type), params: { price_type: { name: @price_type.name } }
    assert_redirected_to price_type_url(@price_type)
  end

  test "should destroy price_type" do
    assert_difference('PriceType.count', -1) do
      delete price_type_url(@price_type)
    end

    assert_redirected_to price_types_url
  end
end

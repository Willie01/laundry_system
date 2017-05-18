require 'test_helper'

class CourierPortraitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courier_portrait = courier_portraits(:one)
  end

  test "should get index" do
    get courier_portraits_url
    assert_response :success
  end

  test "should get new" do
    get new_courier_portrait_url
    assert_response :success
  end

  test "should create courier_portrait" do
    assert_difference('CourierPortrait.count') do
      post courier_portraits_url, params: { courier_portrait: { courier_id: @courier_portrait.courier_id, portrait_id: @courier_portrait.portrait_id, status: @courier_portrait.status } }
    end

    assert_redirected_to courier_portrait_url(CourierPortrait.last)
  end

  test "should show courier_portrait" do
    get courier_portrait_url(@courier_portrait)
    assert_response :success
  end

  test "should get edit" do
    get edit_courier_portrait_url(@courier_portrait)
    assert_response :success
  end

  test "should update courier_portrait" do
    patch courier_portrait_url(@courier_portrait), params: { courier_portrait: { courier_id: @courier_portrait.courier_id, portrait_id: @courier_portrait.portrait_id, status: @courier_portrait.status } }
    assert_redirected_to courier_portrait_url(@courier_portrait)
  end

  test "should destroy courier_portrait" do
    assert_difference('CourierPortrait.count', -1) do
      delete courier_portrait_url(@courier_portrait)
    end

    assert_redirected_to courier_portraits_url
  end
end

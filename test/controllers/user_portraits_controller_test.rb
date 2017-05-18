require 'test_helper'

class UserPortraitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_portrait = user_portraits(:one)
  end

  test "should get index" do
    get user_portraits_url
    assert_response :success
  end

  test "should get new" do
    get new_user_portrait_url
    assert_response :success
  end

  test "should create user_portrait" do
    assert_difference('UserPortrait.count') do
      post user_portraits_url, params: { user_portrait: { status: @user_portrait.status, user_id: @user_portrait.user_id } }
    end

    assert_redirected_to user_portrait_url(UserPortrait.last)
  end

  test "should show user_portrait" do
    get user_portrait_url(@user_portrait)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_portrait_url(@user_portrait)
    assert_response :success
  end

  test "should update user_portrait" do
    patch user_portrait_url(@user_portrait), params: { user_portrait: { status: @user_portrait.status, user_id: @user_portrait.user_id } }
    assert_redirected_to user_portrait_url(@user_portrait)
  end

  test "should destroy user_portrait" do
    assert_difference('UserPortrait.count', -1) do
      delete user_portrait_url(@user_portrait)
    end

    assert_redirected_to user_portraits_url
  end
end

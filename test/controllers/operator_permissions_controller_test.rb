require 'test_helper'

class OperatorPermissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operator_permission = operator_permissions(:one)
  end

  test "should get index" do
    get operator_permissions_url
    assert_response :success
  end

  test "should get new" do
    get new_operator_permission_url
    assert_response :success
  end

  test "should create operator_permission" do
    assert_difference('OperatorPermission.count') do
      post operator_permissions_url, params: { operator_permission: { operator_id: @operator_permission.operator_id, permission_id: @operator_permission.permission_id, status: @operator_permission.status } }
    end

    assert_redirected_to operator_permission_url(OperatorPermission.last)
  end

  test "should show operator_permission" do
    get operator_permission_url(@operator_permission)
    assert_response :success
  end

  test "should get edit" do
    get edit_operator_permission_url(@operator_permission)
    assert_response :success
  end

  test "should update operator_permission" do
    patch operator_permission_url(@operator_permission), params: { operator_permission: { operator_id: @operator_permission.operator_id, permission_id: @operator_permission.permission_id, status: @operator_permission.status } }
    assert_redirected_to operator_permission_url(@operator_permission)
  end

  test "should destroy operator_permission" do
    assert_difference('OperatorPermission.count', -1) do
      delete operator_permission_url(@operator_permission)
    end

    assert_redirected_to operator_permissions_url
  end
end

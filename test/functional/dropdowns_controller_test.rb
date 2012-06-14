require 'test_helper'

class DropdownsControllerTest < ActionController::TestCase
  setup do
    @dropdown = dropdowns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dropdowns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dropdown" do
    assert_difference('Dropdown.count') do
      post :create, dropdown: @dropdown.attributes
    end

    assert_redirected_to dropdown_path(assigns(:dropdown))
  end

  test "should show dropdown" do
    get :show, id: @dropdown.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dropdown.to_param
    assert_response :success
  end

  test "should update dropdown" do
    put :update, id: @dropdown.to_param, dropdown: @dropdown.attributes
    assert_redirected_to dropdown_path(assigns(:dropdown))
  end

  test "should destroy dropdown" do
    assert_difference('Dropdown.count', -1) do
      delete :destroy, id: @dropdown.to_param
    end

    assert_redirected_to dropdowns_path
  end
end

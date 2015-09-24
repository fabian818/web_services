require 'test_helper'

class MyActionsControllerTest < ActionController::TestCase
  setup do
    @my_action = my_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_action" do
    assert_difference('MyAction.count') do
      post :create, my_action: { active: @my_action.active, name: @my_action.name, provider_id: @my_action.provider_id, url: @my_action.url }
    end

    assert_redirected_to my_action_path(assigns(:my_action))
  end

  test "should show my_action" do
    get :show, id: @my_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_action
    assert_response :success
  end

  test "should update my_action" do
    patch :update, id: @my_action, my_action: { active: @my_action.active, name: @my_action.name, provider_id: @my_action.provider_id, url: @my_action.url }
    assert_redirected_to my_action_path(assigns(:my_action))
  end

  test "should destroy my_action" do
    assert_difference('MyAction.count', -1) do
      delete :destroy, id: @my_action
    end

    assert_redirected_to my_actions_path
  end
end

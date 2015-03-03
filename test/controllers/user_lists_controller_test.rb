require 'test_helper'

class UserListsControllerTest < ActionController::TestCase
  setup do
    @user_list = user_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_list" do
    assert_difference('UserList.count') do
      post :create, user_list: { movie_id: @user_list.movie_id, status: @user_list.status, user_id: @user_list.user_id }
    end

    assert_redirected_to user_list_path(assigns(:user_list))
  end

  test "should show user_list" do
    get :show, id: @user_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_list
    assert_response :success
  end

  test "should update user_list" do
    patch :update, id: @user_list, user_list: { movie_id: @user_list.movie_id, status: @user_list.status, user_id: @user_list.user_id }
    assert_redirected_to user_list_path(assigns(:user_list))
  end

  test "should destroy user_list" do
    assert_difference('UserList.count', -1) do
      delete :destroy, id: @user_list
    end

    assert_redirected_to user_lists_path
  end
end

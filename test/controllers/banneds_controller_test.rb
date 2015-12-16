require 'test_helper'

class BannedsControllerTest < ActionController::TestCase
  setup do
    @banned = banneds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:banneds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create banned" do
    assert_difference('Banned.count') do
      post :create, banned: { camper: @banned.camper, name: @banned.name, protected_camper: @banned.protected_camper }
    end

    assert_redirected_to banned_path(assigns(:banned))
  end

  test "should show banned" do
    get :show, id: @banned
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @banned
    assert_response :success
  end

  test "should update banned" do
    patch :update, id: @banned, banned: { camper: @banned.camper, name: @banned.name, protected_camper: @banned.protected_camper }
    assert_redirected_to banned_path(assigns(:banned))
  end

  test "should destroy banned" do
    assert_difference('Banned.count', -1) do
      delete :destroy, id: @banned
    end

    assert_redirected_to banneds_path
  end
end

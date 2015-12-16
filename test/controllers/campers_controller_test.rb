require 'test_helper'

class CampersControllerTest < ActionController::TestCase
  setup do
    @camper = campers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camper" do
    assert_difference('Camper.count') do
      post :create, camper: { age: @camper.age, gender: @camper.gender, name: @camper.name, picked_up: @camper.picked_up }
    end

    assert_redirected_to camper_path(assigns(:camper))
  end

  test "should show camper" do
    get :show, id: @camper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @camper
    assert_response :success
  end

  test "should update camper" do
    patch :update, id: @camper, camper: { age: @camper.age, gender: @camper.gender, name: @camper.name, picked_up: @camper.picked_up }
    assert_redirected_to camper_path(assigns(:camper))
  end

  test "should destroy camper" do
    assert_difference('Camper.count', -1) do
      delete :destroy, id: @camper
    end

    assert_redirected_to campers_path
  end
end

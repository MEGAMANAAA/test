require 'test_helper'

class EnrolledListsControllerTest < ActionController::TestCase
  setup do
    @enrolled_list = enrolled_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enrolled_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enrolled_list" do
    assert_difference('EnrolledList.count') do
      post :create, enrolled_list: { camp: @enrolled_list.camp, campers: @enrolled_list.campers }
    end

    assert_redirected_to enrolled_list_path(assigns(:enrolled_list))
  end

  test "should show enrolled_list" do
    get :show, id: @enrolled_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enrolled_list
    assert_response :success
  end

  test "should update enrolled_list" do
    patch :update, id: @enrolled_list, enrolled_list: { camp: @enrolled_list.camp, campers: @enrolled_list.campers }
    assert_redirected_to enrolled_list_path(assigns(:enrolled_list))
  end

  test "should destroy enrolled_list" do
    assert_difference('EnrolledList.count', -1) do
      delete :destroy, id: @enrolled_list
    end

    assert_redirected_to enrolled_lists_path
  end
end

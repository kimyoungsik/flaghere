require 'test_helper'

class HikingtypesControllerTest < ActionController::TestCase
  setup do
    @hikingtype = hikingtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hikingtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hikingtype" do
    assert_difference('Hikingtype.count') do
      post :create, hikingtype: { name: @hikingtype.name }
    end

    assert_redirected_to hikingtype_path(assigns(:hikingtype))
  end

  test "should show hikingtype" do
    get :show, id: @hikingtype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hikingtype
    assert_response :success
  end

  test "should update hikingtype" do
    put :update, id: @hikingtype, hikingtype: { name: @hikingtype.name }
    assert_redirected_to hikingtype_path(assigns(:hikingtype))
  end

  test "should destroy hikingtype" do
    assert_difference('Hikingtype.count', -1) do
      delete :destroy, id: @hikingtype
    end

    assert_redirected_to hikingtypes_path
  end
end

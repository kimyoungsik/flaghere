require 'test_helper'

class HikingsControllerTest < ActionController::TestCase
  setup do
    @hiking = hikings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hikings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hiking" do
    assert_difference('Hiking.count') do
      post :create, hiking: { datetime: @hiking.datetime, description: @hiking.description, limit: @hiking.limit, location: @hiking.location, name: @hiking.name, province_id: @hiking.province_id, status: @hiking.status, user_id: @hiking.user_id }
    end

    assert_redirected_to hiking_path(assigns(:hiking))
  end

  test "should show hiking" do
    get :show, id: @hiking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hiking
    assert_response :success
  end

  test "should update hiking" do
    put :update, id: @hiking, hiking: { datetime: @hiking.datetime, description: @hiking.description, limit: @hiking.limit, location: @hiking.location, name: @hiking.name, province_id: @hiking.province_id, status: @hiking.status, user_id: @hiking.user_id }
    assert_redirected_to hiking_path(assigns(:hiking))
  end

  test "should destroy hiking" do
    assert_difference('Hiking.count', -1) do
      delete :destroy, id: @hiking
    end

    assert_redirected_to hikings_path
  end
end

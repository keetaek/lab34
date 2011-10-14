require 'test_helper'

class WhatsControllerTest < ActionController::TestCase
  setup do
    @what = whats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:whats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create what" do
    assert_difference('What.count') do
      post :create, what: @what.attributes
    end

    assert_redirected_to what_path(assigns(:what))
  end

  test "should show what" do
    get :show, id: @what.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @what.to_param
    assert_response :success
  end

  test "should update what" do
    put :update, id: @what.to_param, what: @what.attributes
    assert_redirected_to what_path(assigns(:what))
  end

  test "should destroy what" do
    assert_difference('What.count', -1) do
      delete :destroy, id: @what.to_param
    end

    assert_redirected_to whats_path
  end
end

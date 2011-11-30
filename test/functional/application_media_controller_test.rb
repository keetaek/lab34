require 'test_helper'

class ApplicationMediaControllerTest < ActionController::TestCase
  setup do
    @application_medium = application_media(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:application_media)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application_medium" do
    assert_difference('ApplicationMedium.count') do
      post :create, application_medium: @application_medium.attributes
    end

    assert_redirected_to application_medium_path(assigns(:application_medium))
  end

  test "should show application_medium" do
    get :show, id: @application_medium.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @application_medium.to_param
    assert_response :success
  end

  test "should update application_medium" do
    put :update, id: @application_medium.to_param, application_medium: @application_medium.attributes
    assert_redirected_to application_medium_path(assigns(:application_medium))
  end

  test "should destroy application_medium" do
    assert_difference('ApplicationMedium.count', -1) do
      delete :destroy, id: @application_medium.to_param
    end

    assert_redirected_to application_media_path
  end
end

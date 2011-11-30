require 'test_helper'

class AuditionAdminsControllerTest < ActionController::TestCase
  setup do
    @audition_admin = audition_admins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:audition_admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audition_admin" do
    assert_difference('AuditionAdmin.count') do
      post :create, audition_admin: @audition_admin.attributes
    end

    assert_redirected_to audition_admin_path(assigns(:audition_admin))
  end

  test "should show audition_admin" do
    get :show, id: @audition_admin.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @audition_admin.to_param
    assert_response :success
  end

  test "should update audition_admin" do
    put :update, id: @audition_admin.to_param, audition_admin: @audition_admin.attributes
    assert_redirected_to audition_admin_path(assigns(:audition_admin))
  end

  test "should destroy audition_admin" do
    assert_difference('AuditionAdmin.count', -1) do
      delete :destroy, id: @audition_admin.to_param
    end

    assert_redirected_to audition_admins_path
  end
end

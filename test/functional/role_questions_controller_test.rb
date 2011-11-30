require 'test_helper'

class RoleQuestionsControllerTest < ActionController::TestCase
  setup do
    @role_question = role_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:role_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role_question" do
    assert_difference('RoleQuestion.count') do
      post :create, role_question: @role_question.attributes
    end

    assert_redirected_to role_question_path(assigns(:role_question))
  end

  test "should show role_question" do
    get :show, id: @role_question.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role_question.to_param
    assert_response :success
  end

  test "should update role_question" do
    put :update, id: @role_question.to_param, role_question: @role_question.attributes
    assert_redirected_to role_question_path(assigns(:role_question))
  end

  test "should destroy role_question" do
    assert_difference('RoleQuestion.count', -1) do
      delete :destroy, id: @role_question.to_param
    end

    assert_redirected_to role_questions_path
  end
end

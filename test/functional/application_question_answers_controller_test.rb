require 'test_helper'

class ApplicationQuestionAnswersControllerTest < ActionController::TestCase
  setup do
    @application_question_answer = application_question_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:application_question_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application_question_answer" do
    assert_difference('ApplicationQuestionAnswer.count') do
      post :create, application_question_answer: @application_question_answer.attributes
    end

    assert_redirected_to application_question_answer_path(assigns(:application_question_answer))
  end

  test "should show application_question_answer" do
    get :show, id: @application_question_answer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @application_question_answer.to_param
    assert_response :success
  end

  test "should update application_question_answer" do
    put :update, id: @application_question_answer.to_param, application_question_answer: @application_question_answer.attributes
    assert_redirected_to application_question_answer_path(assigns(:application_question_answer))
  end

  test "should destroy application_question_answer" do
    assert_difference('ApplicationQuestionAnswer.count', -1) do
      delete :destroy, id: @application_question_answer.to_param
    end

    assert_redirected_to application_question_answers_path
  end
end

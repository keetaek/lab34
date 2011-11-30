require 'test_helper'

class ApplicationReviewsControllerTest < ActionController::TestCase
  setup do
    @application_review = application_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:application_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application_review" do
    assert_difference('ApplicationReview.count') do
      post :create, application_review: @application_review.attributes
    end

    assert_redirected_to application_review_path(assigns(:application_review))
  end

  test "should show application_review" do
    get :show, id: @application_review.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @application_review.to_param
    assert_response :success
  end

  test "should update application_review" do
    put :update, id: @application_review.to_param, application_review: @application_review.attributes
    assert_redirected_to application_review_path(assigns(:application_review))
  end

  test "should destroy application_review" do
    assert_difference('ApplicationReview.count', -1) do
      delete :destroy, id: @application_review.to_param
    end

    assert_redirected_to application_reviews_path
  end
end

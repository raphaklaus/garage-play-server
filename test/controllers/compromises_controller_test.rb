require 'test_helper'

class CompromisesControllerTest < ActionController::TestCase
  setup do
    @compromise = compromises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compromises)
  end

  test "should create compromise" do
    assert_difference('Compromise.count') do
      post :create, compromise: { datehour: @compromise.datehour, description: @compromise.description, location: @compromise.location, periodicity: @compromise.periodicity, title: @compromise.title }
    end

    assert_response 201
  end

  test "should show compromise" do
    get :show, id: @compromise
    assert_response :success
  end

  test "should update compromise" do
    put :update, id: @compromise, compromise: { datehour: @compromise.datehour, description: @compromise.description, location: @compromise.location, periodicity: @compromise.periodicity, title: @compromise.title }
    assert_response 204
  end

  test "should destroy compromise" do
    assert_difference('Compromise.count', -1) do
      delete :destroy, id: @compromise
    end

    assert_response 204
  end
end

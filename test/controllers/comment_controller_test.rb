require 'test_helper'

class CommentscommentTest < Actioncomment::TestCase
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should create comment" do
    assert_difference('comment.count') do
      post :create, comment: { comment: @comment.comment }
    end

    assert_response 201
  end

  test "should show comment" do
    get :show, id: @comment
    assert_response :success
  end

  test "should update comment" do
    put :update, id: @comment, comment: { comment: @comment.comment }
    assert_response 204
  end

  test "should destroy comment" do
    assert_difference('comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_response 204
  end
end

require 'test_helper'

class RemindersControllerTest < ActionController::TestCase
  setup do
    @reminder = reminders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reminders)
  end

  test "should create reminder" do
    assert_difference('Reminder.count') do
      post :create, reminder: { text: @reminder.text }
    end

    assert_response 201
  end

  test "should show reminder" do
    get :show, id: @reminder
    assert_response :success
  end

  test "should update reminder" do
    put :update, id: @reminder, reminder: { text: @reminder.text }
    assert_response 204
  end

  test "should destroy reminder" do
    assert_difference('Reminder.count', -1) do
      delete :destroy, id: @reminder
    end

    assert_response 204
  end
end

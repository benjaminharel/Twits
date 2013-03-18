require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:one)
    @user = User.find(@message.user_id)
  end

  test "should post message" do
    assert_difference('Message.count') do
      post :create, MessageText: @message.text, UserId: @user.id
    end
  end


  test "should get feed" do
    get :user_feed, ForUserId: @user.id
    assert_response :success
  end


  test "should get global feed" do
    get :index
    assert_response :success
  end

end

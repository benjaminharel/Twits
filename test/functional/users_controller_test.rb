require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should create user" do

    assert_difference('User.count') do
      post :create, UserName: @user.user_name
    end
    assert_response :success
  end

end

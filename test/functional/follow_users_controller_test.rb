require 'test_helper'

class FollowUsersControllerTest < ActionController::TestCase
  setup do
    @follow_user = follow_users(:one)
  end

  test "should follow_user" do
    assert_difference('FollowUser.count') do
      post :create, FollowedUser: @follow_user.follow_user_id, FollowingUser: @follow_user.user_id
    end

    assert_response :success
  end

  test "should unfollow_user" do
    assert_difference('FollowUser.count', -1) do
      delete :destroy, UnfollowedUser: @follow_user.follow_user_id, FollwingUser: @follow_user.user_id
    end

    assert_response :success
  end
end

class FollowUsersController < ApplicationController
  # POST /Follow
  def create
    user = User.find(params[:FollowingUser])
    @follow_user = user.follow_users.create!({:follow_user_id => params[:FollowedUser]})

    render json: @follow_user
  end

  # DELETE /Unfollow
  def destroy
    fu = FollowUser.find_by_user_id_and_follow_user_id params[:FollwingUser], params[:UnfollowedUser]
    FollowUser.destroy fu.id
    render json: {:not_following => User.find(params[:UnfollowedUser]).user_name}
  end
end

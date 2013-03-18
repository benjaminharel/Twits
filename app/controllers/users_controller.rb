class UsersController < ApplicationController
  # POST CreateUser
  def create
    render json: User.create!(:user_name => params[:UserName])
  end

end

class FollowUser < ActiveRecord::Base
  attr_accessible :follow_user_id, :user_id
  belongs_to :user
end

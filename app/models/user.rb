class User < ActiveRecord::Base
  attr_accessible :user_name

  has_many :messages
  has_many :follow_users
end

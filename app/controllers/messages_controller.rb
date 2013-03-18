class MessagesController < ApplicationController
  # GET /GetGlobalFeed
  def index
    render json: Message.order(:updated_at).limit(20)
  end

  # GET /GetFeed
  def user_feed
    feed = []
    User.find(params[:ForUserId]).follow_users.each do |fu|
      user = User.find(fu.follow_user_id)
      user.messages.each do |message|
        feed << { :user_id => user.id, :message => message.text, :timestamp => message.updated_at }
      end
    end
    feed.sort! { |a,b|  a[:timestamp] <=> b[:timestamp] }
    render json: feed.first(20)
  end

  # POST /PostMessage
  def create
    user = User.find(params[:UserId])
    @message = user.messages.create!({:text => params[:MessageText]})

    render json: @message
  end

end

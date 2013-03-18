Twit::Application.routes.draw do
  match 'CreateUser' => 'users#create', :via => :post
  match 'PostMessage' => 'messages#create', :via => :post
  match 'Follow' => 'follow_users#create', :via => :post
  match 'Unfollow' => 'follow_users#destroy', :via => :delete
  match 'GetFeed' => 'messages#user_feed', :via => :get
  match 'GetGlobalFeed' => 'messages#index', :via => :get
end

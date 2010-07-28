Beardly::Application.routes.draw do |map|
  match '/logout', :to => 'sessions#destroy', :as => 'logout'
  match '/login', :to => 'sessions#new', :as => 'login'
  match '/twitter_login', :to => 'auth/twitter#login'

  root :to => 'welcome#index'
end

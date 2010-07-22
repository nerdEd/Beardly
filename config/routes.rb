Beardly::Application.routes.draw do |map|
  resources :sessions

  root :to => "welcome#index"
end

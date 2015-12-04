Rails.application.routes.draw do

  root :to => 'sessions#new'

  get 'oauth', :to => 'sessions#oauth'
  post 'slash_command', :to => 'sessions#slash_command'

  resources :forms, :only => [:new, :create]

end

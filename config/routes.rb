Rails.application.routes.draw do

  root :to => 'sessions#new'

  get 'oauth', :to => 'sessions#oauth'

  resources :forms, :only => [:new, :create]

end

Rails.application.routes.draw do

  root :to => 'sessions#new'

  get 'oauth', :to => 'sessions#oauth'
  get 'slash_command', :to => 'sessions#slash_command'

  resources :forms, :only => [:new, :create]

  resources :evaluations, :only => [:new, :create]

  resources :presentations, :only => [:new, :create]

  resources :external, :only => [] do
    get :dump, :on => :collection
  end

end

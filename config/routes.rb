Rails.application.routes.draw do

  root :to => 'sessions#new'

  get 'oauth', :to => 'sessions#oauth'
  get 'slash_command', :to => 'externals#slash_command'

  resources :forms, :only => [:new, :create]

  resources :evaluations, :only => [:new, :create]

  resources :presentations, :only => [:new, :create]

  resources :dump, :only => [] do
    get :payroll_hero, :on => :collection
    get :daily_buzz, :on => :collection
    get :evaluations, :on => :collection
  end

end

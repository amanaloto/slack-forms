Rails.application.routes.draw do

  # root :to => 'sessions#new'

  root :to => 'forms#new'

  resources :forms, :only => [:new, :create]

end

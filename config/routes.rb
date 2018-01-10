Rails.application.routes.draw do

  root 'activities#index'
  resources :sessions, only: [:new, :create]
  resources :users 
  resources :activities
  delete '/logout' => 'sessions#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

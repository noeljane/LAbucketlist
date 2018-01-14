Rails.application.routes.draw do
  
  root 'activities#index'
  
  resources :sessions, only: [:new, :create]
  resources :users 
  
  resources :activities do 
    resources :comments
  end

  post '/activities/:id/copy' => 'activities#copy', as: :copy_activity

  delete '/logout' => 'sessions#destroy', as: :logout

  resources :account_activations, only: [:edit]

  resources :password_resets, only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

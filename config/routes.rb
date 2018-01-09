Rails.application.routes.draw do
  get 'activities/index'

  get 'activities/show'

  get 'activities/new'

  get 'activities/create'

  get 'activities/edit'

  get 'activities/update'

  get 'activities/destroy'

  root 'users#index'
  resources :users 
  resources :sessions, only: [:new, :create]

  delete '/logout' => 'sessions#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

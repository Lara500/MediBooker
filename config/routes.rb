Rails.application.routes.draw do
  resources :appointments, except: [:destroy]
  resources :doctors, only: [:index, :show, :new, :create]
  resources :patients, only: [:index, :show, :new, :create] 


  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  resources :appointments, except: [:destroy]
  resources :doctors, only: [:index, :show, :new, :create]
  resources :patients, only: [:index, :show, :new, :create] 
  get 'appointments/patient/:patient_id', to: 'appointments#patient_appointments', as: 'patient_appointments'
  get 'statistics', to: 'statistics#index'


  # Defines the root path route ("/")
  # root "articles#index"
end

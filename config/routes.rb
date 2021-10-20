Rails.application.routes.draw do
  get 'us/about_us'
  get 'us/help_me'
  get 'dashboard_pharmacien/:id' => "dashboard_pharmacien#index", as: "pharmacien"
  resources :schedules
  resources :products
  resources :pharmacies do 
      resources :comments
  end
  resources :favorites, only: [:create, :destroy]
  root "homepage#index"
  get 'users/:id' => 'users#show', as: "profile"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
end

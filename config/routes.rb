Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'us/about_us'
  get 'us/help_me'
  get 'dashboard_pharmacien/:id' => "dashboard_pharmacien#index", as: "pharmacien"
  get "/search", to: "pharmacies#search", as: "search_pharmacies"
  get "/psearch", to: "pharmacies#psearch", as: "search_products"
  get "/asking", to: "products#asking", as: "asking"
  resources :schedules
  resources :products
  resources :pharmacies do 
      resources :comments
  end
  resources :favorites, only: [:create, :destroy]
  root "homepage#index"
  get 'users/:id' => 'users#show', as: "profile"
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unprocessable'
  get '/500', to: 'errors#internal_server'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
end

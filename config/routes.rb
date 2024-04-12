Rails.application.routes.draw do
  resources :tasks

  devise_for :customers

  resources :bikes, only: [:index, :show]
  get '/filter', to: 'bikes#filter', as: 'bike_filter'
  resources :categories, only: [:show]
  resources :cart, only: [:create, :update, :destroy]

  resources :checkout, only: [:index]
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  resources :orders

  get '/pages/:permalink' => "pages#permalink", as: 'permalink'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  root "bikes#index"
end

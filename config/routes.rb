Rails.application.routes.draw do

  # Authentication
  # @implemented
  devise_for :users

  # Application
  # @implemented
  root to: 'home#index'
  resource :newsletter, only: [:create]
  resource :contact, only: [:new, :create]

  # Dashboard
  # @implemented
  namespace :dashboard do
    get '', to: 'home#index'
    resources :editions do
      resources :editals
      resources :subscriptions
      resources :approveds
    end
    resources :newsletters
    resources :posts
  end
end

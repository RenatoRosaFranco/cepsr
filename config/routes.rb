Rails.application.routes.draw do

  namespace :dashboard do
    get 'home/index'
  end

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
      resources :subscriptions
    end
    resources :newsletters
    resources :posts
  end
end

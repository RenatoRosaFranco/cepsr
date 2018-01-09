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
    resources :editions do
      resources :subscriptions
    end
    resources :newsletters
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

FourthAndInches::Application.routes.draw do

  devise_for :users
  root 'home#index'

  get 'dashboard' => 'dashboard#show', as: 'dashboard'

  resources :teams    #, only: [:new, :create, :show]
  resources :dashboard, only: [:create]
  resources :players      #, only: [:new, :create, :show]
end

FourthAndInches::Application.routes.draw do

  devise_for :users
  root 'home#index'

  resources :teams, only: [:create]

  get 'dashboard' => 'dashboard#show', as: 'dashboard'
  resources :dashboard, only: [:create]

end

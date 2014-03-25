FourthAndInches::Application.routes.draw do

  devise_for :users

  root 'home#index'
  get 'dashboard' => 'dashboard#show', as: 'dashboard'
  get 'about'     => 'home#about',     as: 'about'
  get 'faq'       => 'home#faq',       as: 'faq'
  get 'contact'   => 'home#contact',   as: 'contact'

  resources :teams
  resources :dashboard, only: [:create]
  resources :players
end

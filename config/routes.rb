FourthAndInches::Application.routes.draw do

  devise_for :users

  root 'home#index'
  get 'dashboard' => 'dashboard#show', as: 'dashboard'
  get 'about'     => 'home#about',     as: 'about'
  get 'faq'       => 'home#faq',       as: 'faq'
  get 'contact'   => 'home#contact',   as: 'contact'
  get 'staff'     => 'teams#staff',    as: 'staff'
  get 'schedule_manager' => 'teams#schedule_manager', as: 'schedule_manager'
  get 'team_manager' => 'teams#team_manager', as: 'team_manager'

  resources :teams
  resources :dashboard, only: [:create]
  resources :players
end

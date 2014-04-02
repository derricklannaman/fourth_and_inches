FourthAndInches::Application.routes.draw do

  devise_for :users

  root 'home#index'
  get 'dashboard' => 'dashboard#show', as: 'dashboard'
  get 'about'     => 'home#about',     as: 'about'
  get 'faq'       => 'home#faq',       as: 'faq'
  get 'contact'   => 'home#contact',   as: 'contact'

  get 'schedule_manager' => 'schedule#schedule_manager', as: 'schedule_manager'
  get 'team_manager' => 'teams#team_manager', as: 'team_manager'
  get 'office_manager' => 'office#office_manager', as: 'office_manager'


  resources :teams
  resources :dashboard, only: [:create]
  resources :players
end

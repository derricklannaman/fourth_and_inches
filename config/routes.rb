FourthAndInches::Application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  root 'home#index'
  get 'about'     => 'home#about',     as: 'about'
  get 'contact'   => 'home#contact',   as: 'contact'
  get 'dashboard' => 'dashboard#show', as: 'dashboard'
  get 'faq'       => 'home#faq',       as: 'faq'
  get 'features'  => 'home#features',  as: 'features'


  get 'coaches_corner' => 'coaches#coaches_corner', as: 'coaches_corner'
  get 'office_manager' => 'office#office_manager',
                                                    as: 'office_manager'
  get 'schedule_manager' => 'schedule#schedule_manager',
                                                    as: 'schedule_manager'
  get 'team_manager' => 'teams#team_manager',       as: 'team_manager'

  resources :programs, only: [:new, :create, :show, :index]
  resources :events, only: [:index]
  resources :coaches, only: [:index]
  resources :dashboard, only: [:create]
  resources :players
  resources :teams
end

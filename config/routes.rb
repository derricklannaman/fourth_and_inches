FourthAndInches::Application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'home#index'
  get 'about'     => 'home#about',     as: 'about'
  get 'contact'   => 'home#contact',   as: 'contact'
  get 'dashboard' => 'dashboard#show', as: 'dashboard'
  get 'faq'       => 'home#faq',       as: 'faq'
  get 'features'  => 'home#features',  as: 'features'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  # Access Codes
  post 'send_access_code' => 'access_codes#send_access_code', as: 'send_access_code'
  get 'access/:id' => 'access_codes#verify_access_code', as: 'verify_access_code'

  get 'coaches_corner' => 'coaches#coaches_corner', as: 'coaches_corner'
  get 'office_manager' => 'office#office_manager',
                                                    as: 'office_manager'
  get 'schedule_manager' => 'schedules#schedule_manager',
                                                    as: 'schedule_manager'
  get 'team_manager' => 'teams#team_manager',       as: 'team_manager'
  post 'opponents/:id/list_destroy' => 'opponents#list_destroy',  as: 'list_destroy'

  resources :users
  resources :coaches, only: [:new, :create]
  resources :programs, only: [:new, :create, :show, :index]
  resources :divisions
  resources :opponents
  resources :events, only: [:index]
  resources :schedules, except: :index
  resources :dashboard, only: :create
  resources :players
  resources :teams
  resources :sponsors, only: [:index]
  resources :inventory, only: [:index]
  resources :merchandise, only: [:index]
end

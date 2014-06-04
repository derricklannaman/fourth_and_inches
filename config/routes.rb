FourthAndInches::Application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  root 'home#index'
  get 'about'     => 'home#about',     as: 'about'
  get 'contact'   => 'home#contact',   as: 'contact'
  get 'dashboard' => 'dashboard#show', as: 'dashboard'
  get 'faq'       => 'home#faq',       as: 'faq'
  get 'features'  => 'home#features',  as: 'features'

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

  get 'programs/:id/logo' => 'programs#logo', as: 'logo'

  get "websites/:id" => 'websites#show', as: 'website'
  get 'all_players' => 'websites#all_players'

  resources :users
  resources :coaches,     only: [:new, :create]
  resources :programs
  resources :websites,    only: :create
  resources :divisions
  resources :opponents
  resources :events,      only: [:index]
  resources :schedules,   except: :index
  resources :dashboard,   only: :create
  resources :players
  resources :teams
  resources :sponsors,    only: [:index]
  resources :inventory,   only: [:index]
  resources :merchandise, only: [:index]
end

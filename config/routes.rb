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
  get 'team_dashboard/:id' => 'teams#team_dashboard', as: 'team_dashboard'

  # post 'opponents/:id/list_destroy' => 'opponents#list_destroy',  as: 'list_destroy'
  post 'programs/set_fee' => 'programs#set_fee'
  post 'programs/:id/ajax_program_edits' => 'programs#ajax_program_edits'

  get "websites/:id" => 'websites#show', as: 'website'
  get 'all_players' => 'websites#all_players'

  resources :users
  resources :coaches,     only: [:new, :create]
  resources :programs,    except: [:edit]
  resources :websites,    only: :create
  resources :charges
  resources :divisions
  resources :opponents do
    member do
      post :list_destroy
    end
  end



  resources :events,      only: [:index]
  resources :schedules,   except: :index
  resources :dashboard,   only: :create
  resources :players
  resources :teams
  resources :sponsors,    only: [:index]
  resources :inventory,   only: [:index]
  resources :merchandise, only: [:index]
end

FourthAndInches::Application.routes.draw do

  devise_for :users

  root 'home#index'
  get 'about'     => 'home#about',     as: 'about'
  get 'contact'   => 'home#contact',   as: 'contact'
  get 'dashboard' => 'dashboard#show', as: 'dashboard'
  get 'faq'       => 'home#faq',       as: 'faq'


  get 'coaches_corner' => 'coaches#coaches_corner', as: 'coaches_corner'
  get 'office_manager' => 'office#office_manager',
                                                    as: 'office_manager'
  get 'schedule_manager' => 'schedule#schedule_manager',
                                                    as: 'schedule_manager'
  get 'team_manager' => 'teams#team_manager',       as: 'team_manager'


  resources :dashboard, only: [:create]
  resources :players
  resources :teams
end

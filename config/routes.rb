FourthAndInches::Application.routes.draw do

  devise_for :users
  root 'home#index'
  get 'dashboard' => 'dashboard#show', as: 'dashboard'

end

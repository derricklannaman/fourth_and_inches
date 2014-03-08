FourthAndInches::Application.routes.draw do

  devise_for :users
  root 'welcome#index'
  get 'dashboard/:id' => 'dashboard#show', as: 'dashboard'

end

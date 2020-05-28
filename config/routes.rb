Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :index]
  root to: 'home#home'
  get 'departments/relation', to: 'departments#relation', action: :relation
  resources :departments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

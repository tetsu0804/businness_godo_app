Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :index]
  root to: 'home#home'
  resources :departments do
    get '/squeeze', to: 'departments#squeeze', action: :squeeze
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

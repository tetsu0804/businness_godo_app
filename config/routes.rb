Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update, :destroy] do
    resources :work_books, only: [:new, :create, :edit, :update, :destroy, :index]
    get '/booking', to: 'work_books#booking'
    get '/search', to: 'work_books#search'
  end
  get '/work_books', to: 'work_books#book'
  root to: 'home#home'
  resources :departments do
    get '/squeeze', to: 'departments#squeeze', action: :squeeze
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  get 'books/new'
  get 'books/create'
  get 'books/index'
  get 'books/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root :to => 'home#top'

devise_for :users
  resources :books, only: [:new, :create, :index, :show]

end

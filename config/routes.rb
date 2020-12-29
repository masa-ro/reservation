Rails.application.routes.draw do
  get 'top/index'
  resources :rooms
  resources :entries, only: [:new, :create, :destroy, :index], path: :rentals

  get 'login/login'
  get 'login/logout'

  get 'login/login2'

  # get 'entries/index', to: 'entries#index'
  # get 'entries/new', to: 'entries#new'
  # post 'entries/create', to: 'entries#create'
  # delete 'entries/destroy', to: 'entries#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root :to => 'memos#index'
  resource :users, only: [:new, :show, :edit, :create, :update]
  get 'login', to: 'sessions#new', as: 'new_sessions'
  post 'login', to: 'sessions#create', as: 'create_sessions'
  delete 'logout', to: 'sessions#destroy', as: 'destroy_sessions'
  resources :memos, only: [:index, :update, :destroy, :create]
  post 'ajax_memos_create', to: 'memos#ajax_create', as: 'ajax_memos_create'
  get 'search', to: 'memos#search', as: 'search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

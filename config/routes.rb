Rails.application.routes.draw do
  root :to => 'memos#index'
  resources :memos, only: [:index, :update, :destroy, :create]
  post 'ajax_memos_create', to: 'memos#ajax_create', as: 'ajax_memos_create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

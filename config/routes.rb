Rails.application.routes.draw do
  
    namespace :admin do
      root 'dashboards#index'
      get 'dashboard', to: 'dashboards#index'
      resources :categories, except: [:show]
      resources :articles, except: [:show]
      resources :project_types
      resources :projects, except: [:show]
      resources :pages
      resources :blocks
      resources :users, except: [:show]
      resources :settings, only: [:update, :index]
    end

  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  get 'home/index'
  root 'pages#show', defaults: { id: 1 }
  resources :articles, path: 'blog', only: [:index, :show]
  resources :categories, only: [:show]
  get 'contact', to: 'contacts#new'
  resources :contacts, except: [:new]
  resources :projects, only: [:show, :index]
  resources :pages, only: [:show]
  resources :users, only: [:show]
  
  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#unacceptable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end

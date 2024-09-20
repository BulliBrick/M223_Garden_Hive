Rails.application.routes.draw do
  get "pages/home"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "comments/create"
  get "comments/update"
  get "comments/destroy"
  get "article_approvals/create"
  get "article_approvals/update"
  get "articles/index"
  get "articles/show"
  get "articles/new"
  get "articles/create"
  get "articles/edit"
  get "articles/update"
  get "articles/destroy"
  get "themes/index"
  get "themes/show"
  get "themes/new"
  get "themes/create"
  get "themes/edit"
  get "themes/update"
  get "themes/destroy"
  get "users/index"
  get "users/show"
  get "users/new"
  get "users/create"
  get "users/edit"
  get "users/update"
  get "users/destroy"
  get "user_roles/index"
  get "user_roles/show"
  get "user_roles/new"
  get "user_roles/create"
  get "user_roles/edit"
  get "user_roles/update"
  get "user_roles/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"



  resources :articles
  namespace :admin do
    resources :users
  end

    root "pages#home"

end

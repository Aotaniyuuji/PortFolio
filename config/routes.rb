Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    root :to => "homes#top"
    get "about" => "homes#about"
    resources :users, only: [:index,:show,:edit,:update]
    resources :genres, only: [:index,:create,:edit,:update]
    resources :games, only: [:index,:new,:create,:show,:edit,:update,:destroy]
    resources :reviews, only: [:show,:edit,:update,:destroy]
  end

  scope module: :public do
    root :to => "homes#top"
    get "about" => "homes#about"
    resources :users, only: [:show,:edit,:update]
    get 'users' => redirect("/users/sign_up")
    resources :games, only: [:index,:show] do
      resources :reviews, only: [:create,:edit,:update,:destroy]
    end
  end
  get "check" => "public/users#check"
  patch "withdrawal" => "public/users#withdrawal"
  get "search" => "public/searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

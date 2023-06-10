Rails.application.routes.draw do
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root :to => "homes#top"
    resources :users, only: [:index,:show,:edit,:update]
    resources :genres, only: [:index,:create,:edit,:update]
    resources :games, only: [:index,:new,:create,:show,:edit,:update,:destroy]
    resources :reviews, only: [:show,:destroy]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

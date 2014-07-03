IReadThat::Application.routes.draw do
  resources :events


  resources :books


  devise_for :users

  get "dashboard/index", as: "dashboard"

  root to: 'dashboard#index'
end

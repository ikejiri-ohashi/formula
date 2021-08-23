Rails.application.routes.draw do
  devise_for :users
  root to: "questions#index"
  resources :questions, only: [:new, :create, :show] do
    resources :answers, only: [:new, :create]
    resources :likes, only: [:create, :destroy]
  end
end

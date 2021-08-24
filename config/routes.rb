Rails.application.routes.draw do
  devise_for :users
  root to: "questions#index"
  resources :questions, only: [:new, :create, :show] do
    resources :likes, only: [:create, :destroy]
    resources :answers, only: [:new, :create] do
      resources :favorites, only: [:create, :destroy]
    end
    resources :comments, only: [:create]
  end
end

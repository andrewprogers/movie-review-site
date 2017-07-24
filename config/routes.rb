Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#index"
  resources :users, only: [:index, :destroy]
  resources :movies do
    resources :reviews, only: [:create, :update, :edit, :destroy] do
      resource :votes, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :reviews, only: [:index]
    end
  end
end

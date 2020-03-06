Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:show, :new] do
    collection do
      get 'confirm'
    end
  end
  resources :users, only: :show 
end

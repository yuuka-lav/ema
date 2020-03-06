Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show, :new] do
    collection do
      get 'confirm'
    end
  end
  resources :users, only: :show do
    collection do
      get 'card'
    end
  end
end

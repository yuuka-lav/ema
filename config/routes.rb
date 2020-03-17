Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    member do
      get 'confirm', to: 'items#confirm'
      post 'pay', to: 'items#pay'
      get 'done', to: 'items#done'
    end
    collection do
      get 'category_children'
      get 'category_grandchildren'
      get 'category'
    end
  end
  resources :users, only: :show 
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end

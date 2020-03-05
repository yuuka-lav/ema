Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: :show do
    collection do
      get 'confirm'
    end
  end
end

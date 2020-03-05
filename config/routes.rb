Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: :show do
    collection do
      get 'confirm'
    end
  end
end

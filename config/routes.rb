Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    collection do
      get 'confirm'
    end
  end
end

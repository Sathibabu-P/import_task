Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions do
    collection { post :import }
  end
  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      resources :questions, only: [:index]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

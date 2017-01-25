Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :update]
      resources :sales, only: [:create]
      resources :bogo, only: [:create]

      namespace :products do
        get 'total', to: 'total#index'
      end
    end
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # this is where i put custom routes and resources
      resources :users, only: [:create, :show] do
        resources :books
      end

      resources :books, only: [:index]
      resources :users_books

      post "/login", to: "sessions#login"
      get "persist", to: "sessions#persist"
    end
  end
end

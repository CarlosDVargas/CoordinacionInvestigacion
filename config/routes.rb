Rails.application.routes.draw do
  resources :minutes
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }

  resources :investigators do
    collection do
      match 'search' => 'investigators#search', via: [:get, :post], as: :search
    end
  end
end

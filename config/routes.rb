Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end

    unauthenticated do
      root 'users#welcome', as: :unauthenticated_root
    end
  end

  resources :categories
  resources :expenses, only: [:new, :create, :destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end

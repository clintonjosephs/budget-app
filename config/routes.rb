Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :categories do
    resources :expenses, only: [:new, :create, :show]
  end

  # Defines the root path route ("/")
  # root "articles#index"
  get "visualize_budget" => "budgets#visualize_budget"
end

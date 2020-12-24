Rails.application.routes.draw do
  devise_for :users
  root "books#index"
  resources :books, only: [:index, :show, :new, :create] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
    end
  end

  resources :categories, only: [:show]
end

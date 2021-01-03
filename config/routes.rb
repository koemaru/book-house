Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root "books#index"
  resources :books, only: [:index, :show, :new, :create, :edit, :update] do
    resource :likes, only: [:create, :destroy]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
    end
  end

  resources :categories, only: [:show]
  resources :mypages, only: [:index, :destroy]
  resources :recommendations, only: [:index]
  resources :users, only: [:edit, :update]
end

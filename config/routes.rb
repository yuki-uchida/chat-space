Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'search'
    end
  end
  resources :groups, only: [:new, :edit, :update, :create] do
    resources :messages, only: [:index, :create]
  end

end

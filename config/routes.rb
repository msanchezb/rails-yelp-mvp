Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :new, :show, :create] do
    resources :reviews, only: [:index, :create]
  end

  namespace :admin do
    resources :restaurants, only: [:destroy, :edit, :update, :index]
  end

  root to: "restaurants#index"
end

Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :contracts, only: [:index, :show, :new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

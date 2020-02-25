Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :loans do
    resources :contracts, only: [:index, :show, :new, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

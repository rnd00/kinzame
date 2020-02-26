Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'dashboard', to: 'users#contracts_index', as: 'contracts_index'

  resources :loans do
    resources :contracts, only: [:index, :new, :create]
  end

  resources :contracts, only: [:show, :edit, :update] do
    patch 'repaid_loan', to: "contracts#repaid_loan!"
    patch 'approve', to: "contracts#approve!"
    patch 'repaid_lender', to: "contracts#repaid_lender!"
  end
end

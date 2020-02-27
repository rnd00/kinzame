Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'
  get 'results', to: 'loans#results', as: 'results'
  post 'charge_wallet', to: 'users#charge_wallet', as: 'recharge'

  resources :loans do
    resources :contracts, only: [:index, :new, :create]
  end

  resources :contracts, only: [:show, :edit, :update] do
    patch 'repaid_loan', to: "contracts#repaid_loan"
    patch 'approve', to: "contracts#approve"
    patch 'repaid_lender', to: "contracts#repaid_lender"
    patch 'rejected', to: "contracts#rejected"
  end
end

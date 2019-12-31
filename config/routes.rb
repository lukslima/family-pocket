Rails.application.routes.draw do
  root 'dashboard#index'
  
  resources :categories
  resources :accounts

  resources :transactions, only: %w[index new destroy]
  resources :incomes, only: %w[create update]
  resources :expenses, only: %w[create update]
end

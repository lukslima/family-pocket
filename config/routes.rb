Rails.application.routes.draw do
  resources :budgets
  root 'dashboard#index'
  
  resources :categories
  resources :accounts

  resources :transactions, only: %w[index new destroy]
  resources :incomes, only: %w[index edit create update]
  resources :expenses, only: %w[index edit create update]
end

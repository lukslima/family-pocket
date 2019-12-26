Rails.application.routes.draw do
  get 'page/index'
  resources :transactions
  resources :categories
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

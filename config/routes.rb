Rails.application.routes.draw do
  resources :user_levels
  resources :mortgage_accounts
  resources :retirement_accounts
  resources :big_emergencies
  resources :small_emergencies
  resources :stack_accounts
  resources :consumer_debts
  resources :credit_card_debts
  devise_for :users
  root 'welcome#home'
  get 'consumer_debts', to: 'users#consumer_debts'
  get 'credit_card_debts', to: 'credit_card_debts#index'
  get 'initial_questions', to: 'users#initial_questions'
  get 'levels', to: 'users#levels'
  get 'my_portfolio', to: 'users#my_portfolio'
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

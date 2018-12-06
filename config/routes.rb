Rails.application.routes.draw do
  resources :credit_card_debts
  devise_for :users
  root 'welcome#home'
  get 'consumer_debts', to: 'users#consumer_debts'
  get 'credit_card_debts', to: 'credit_card_debts#index'
  get 'initial_questions', to: 'users#initial_questions'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

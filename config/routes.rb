Rails.application.routes.draw do
  devise_for :users
  root 'welcome#home'
  get 'consumer_debts', to: 'users#consumer_debts'
  get 'initial_questions', to: 'users#initial_questions'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

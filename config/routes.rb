Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "/questions/list", to: "home#show", as: "questions"
  resources :test_questions
  resources :classic_questions
  get "/users/list", to: "user#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

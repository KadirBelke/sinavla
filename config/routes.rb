Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root "home#index", as: "home"
  get "/questions/list", to: "home#show", as: "questions"
  resources :test_questions
  resources :classic_questions
  get "/users/list", to: "user#show"
  get '/users/update/:id', to: 'user#update', as: 'user_update'
  get "/lessons/list", to: "lessons#show"
  resources :lessons

end

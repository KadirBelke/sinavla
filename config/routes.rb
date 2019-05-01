Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "/questions/list", to: "home#show", as: "questions"
  resources :tests
  resources :classics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

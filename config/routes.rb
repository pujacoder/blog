Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"
  get "comments/_form"

  #get "/articles",to:"articles#index"
  #get "/articles/:id", to: "articles#show"
  
  resources :articles do
    resources :comments
    resources :users
  end

end

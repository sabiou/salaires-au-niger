Rails.application.routes.draw do
  resources :salaries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  get "/faq", to: "faq#show"
  get "/simulator", to: "simulator#show"
  get "/jobs", to: "jobs#show"
  root "salaries#index"
end
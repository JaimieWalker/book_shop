Rails.application.routes.draw do
  get "publisher/index"
  get "publisher/index/:id", to: "publisher#show"
  get "shops", to: "shops#index"
  get "shops/:id", to: "shops#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "publisher#index"
end

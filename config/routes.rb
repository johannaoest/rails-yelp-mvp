Rails.application.routes.draw do
  resources :restaurants, only: %i[index new create show]

  resources :reviews, only: %i[new create destroy]
end

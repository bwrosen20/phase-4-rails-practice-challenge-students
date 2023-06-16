Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :students, only: [:create, :index, :update, :destroy]
  resources :instructors, only: [:create, :index, :update, :destroy] 
end

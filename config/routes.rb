Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :student, only: [:create, :index, :update, :destroy]
  resources :instructor, only: [:create, :index, :update, :destroy] 
end

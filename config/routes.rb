Rails.application.routes.draw do
  resources :gardens, only: [ :show ] do
    resources :plants, only: [ :new, :create ]
  end
  resources :plants, only: :destroy
end

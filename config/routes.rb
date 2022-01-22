Rails.application.routes.draw do
  root to: 'gardens#index'
  resources :gardens, only: %i[ show ] do
    resources :plants, only: %i[ new create ]
  end
  resources :plants, only: %i[ destroy ] do
    resources :plant_tags, only: %i[ new create ]
  end

end

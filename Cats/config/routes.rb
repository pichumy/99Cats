Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats

  # resources :cats, only: [:index] do
  #   resources :cats_rental_requests, only: [:new]
  # end
  resources :cats_rental_requests, only: [:new]


end

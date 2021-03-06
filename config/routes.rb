Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show do
    resources :reservations, only: %i[show index create]
  end

  resources :routes, only: %i[show index] do
    resources :buses, only: %i[index]
    resources :stops, only: %i[index]
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comics do
    collection do
       get 'available'
     end
    resources :bookings, only: [:new, :create]
  end

  resources :users do
    resources :bookings, only: [:index, :destroy]
  end

  resources :comics, only: [] do
    collection do
      get :search
    end
  end
end


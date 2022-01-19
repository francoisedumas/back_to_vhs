Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get "contact", to: "pages#contact"
  post "contact", to: "pages#send_contact_mail"

  resources :movies, only: [:index, :show] do
    resources :bookings, only: [:create]
  end

  resource :dashboard, only: [:show]

  namespace :owner do
    resources :movies, only: [:new, :create]
    resources :bookings do
      member do
        patch :accept
        patch :refuse
      end
    end
  end

end

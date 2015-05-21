Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :artists do
    resources :albums
  end

  resources :albums do
    resources :tracks
  end

  root 'artists#index'

end

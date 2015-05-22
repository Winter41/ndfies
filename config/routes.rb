Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :artists do
    resources :albums
  end

  resources :albums do
    resources :tracks
  end

  devise_scope :user do
    authenticated :user do
      root 'artist#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  root 'artist#index'
end

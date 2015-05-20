Rails.application.routes.draw do
  get 'tracks/new'

  get 'tracks/create'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :artists do
    resources :albums
  end

  resources :albums do
    resources :tracks
  end

  root 'artists#index'

end

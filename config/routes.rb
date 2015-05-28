Rails.application.routes.draw do
  root 'landing#index'

  get 'landing/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :artists do
    resources :albums
  end

  resources :albums do
    resources :tracks
  end

  #devise_scope :user do
    #authenticated :user do
      #root 'artists#index', as: :authenticated_root
    #end
    #unauthenticated do
      #root 'landing#index', as: :unauthenticated_root
    #end
  #end

end

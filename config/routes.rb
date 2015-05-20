Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :artists do
    resources :albums
  end

  root 'artists#index'

end

Rails.application.routes.draw do
  devise_for :users

  mount Swaggard::Engine, at: '/swagger'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end

end
Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "api/v1/users/omniauth_callbacks" }


  mount Swaggard::Engine, at: '/swagger'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resource :me, controller: :me, only: [:show, :update]

      resources :users, only: [:create]

      resource :sessions, only: [] do
        post :authenticate, action: :create
      end

    end
  end

end
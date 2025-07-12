# frozen_string_literal: true

require "sidekiq/web"
require "rack/session/cookie"
secret_key_base = Rails.application.credentials.secret_key_base
Sidekiq::Web.use(Rack::Session::Cookie, secret: secret_key_base)

Rails.application.routes.draw do
  resources :pets, only: [:index, :show, :create] do
    member do
      put :expire_vaccination
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  mount Sidekiq::Web => "/sidekiq"
end

# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: redirect('/api/v1/welcome')

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        sessions: 'api/v1/auth/sessions',
        registrations: 'api/v1/auth/registrations',
        passwords: 'api/v1/auth/passwords',
        confirmations: 'api/v1/auth/confirmations'
      }
      resources :health_checks, only: :index
      resources :welcome, only: :index
      resources :products, only: :index
    end
  end

  ## 開発環境用letter_opener
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end

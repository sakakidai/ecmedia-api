Rails.application.routes.draw do
  get '/', to: redirect('/api/v1/welcome')

  namespace :api do
    namespace :v1 do
      resources :health_checks, only: :index
      resources :welcome, only: :index
      resources :products, only: :index
    end
  end
end

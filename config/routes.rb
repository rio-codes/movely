Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'auth#login'
      post '/auth/register', to: 'auth#register'
      get '/auth/auto_login', to: 'auth#auto_login'
      resources :users, only: [:create]
    end
  end

  root 'home#index'
  get '/*path', to: 'home#index', constraints: ->(req) { !req.path.match(%r{^/api}) }
end
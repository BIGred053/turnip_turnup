Rails.application.routes.draw do
  resources :sales, except: :index do
    post '/join', to: 'sales#join'
    post '/next', to: 'sales#next'
  end
  resources :islands, except: :index
  devise_for :users
  root to: 'atlas#home'
end

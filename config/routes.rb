Rails.application.routes.draw do
  resources :islands, except: :index
  devise_for :users
  root to: 'atlas#home'
end

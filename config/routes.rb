Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  get 'visitors/index'
  root to: 'visitors#index'
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :users
end

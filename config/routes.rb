Rails.application.routes.draw do

  get 'categories/index'
  get 'stores/index'
  get 'products/index'
  get 'companies/index'
  get 'forum_threads/index'
  get 'calendars/index'
  get 'dashboards/index'
  get 'landings/index'
  get 'settings/change_locale'

  mount Upmin::Engine => '/admin'

  get 'visitors/index'
  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale

  # root to: 'visitors#index'
  root to: "landings#index"

  devise_for :users, controllers: {registrations: 'registrations'}

  resources :users

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  match 'landing',    to: 'landings#index',   via: [:get]
  match 'dashboard',  to: 'dashboards#index', via: [:get]
  match 'dashboards', to: 'dashboards#index', via: [:get]

end

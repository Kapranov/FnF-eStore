Rails.application.routes.draw do
  get 'settings/change_locale'

  mount Upmin::Engine => '/admin'

  get 'visitors/index'
  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale

  root to: 'visitors#index'

  devise_for :users, controllers: {registrations: 'registrations'}
  resources :users

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

end

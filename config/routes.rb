Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  get 'visitors/index'
  root to: 'visitors#index'
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :users

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
end

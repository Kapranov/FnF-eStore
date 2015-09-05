module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) << :name
    # devise_parameter_sanitizer.for(:account_update) << :name
    # devise_parameter_sanitizer.for(:account_update) << :note
    # devise_parameter_sanitizer.for(:account_update) << :about
    # devise_parameter_sanitizer.for(:account_update) << :avatar_id
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :note, :about, :avatar_id) }
  end

end

DeviseController.send :include, DevisePermittedParameters

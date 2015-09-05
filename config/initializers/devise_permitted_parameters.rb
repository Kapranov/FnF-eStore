module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:account_update) << :note
    devise_parameter_sanitizer.for(:account_update) << :about
    devise_parameter_sanitizer.for(:account_update) << :avatar_id
  end

end

DeviseController.send :include, DevisePermittedParameters

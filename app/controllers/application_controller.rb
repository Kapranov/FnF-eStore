class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  include FastGettext::Translation

  def set_locale
    if cookies[:FnfEstore_locale] && I18n.available_locales.include?(cookies[:FnfEstore_locale].to_sym)
      l = cookies[:FnfEstore_locale].to_sym
    else
      begin
        country_code = request.location.country_code
        if country_code
          country_code = country_code.downcase.to_sym
          [:ru, :ua, :by].include?(country_code) ? l = :uk : l = :en
        else
          l = I18n.default_locale
        end
      rescue
        l = I18n.default_locale
      ensure
        cookies.permanent[:FnfEstore_locale] = l
      end
    end
    I18n.locale = l
  end
end

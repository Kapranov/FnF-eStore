require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module FnfEstore
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    config.i18n.fallbacks = true
    config.time_zone = 'Kyiv'
    config.i18n.default_locale = :uk
    config.i18n.available_locales = [:en, :ru, :uk]
    config.active_record.timestamped_migrations = true
    config.active_record.raise_in_transactional_callbacks = true
    config.exceptions_app = self.routes
    config.assets.paths << "#{Rails}/vendor/assets/fonts"
    config.autoload_paths << Rails.root.join('lib')
  end
end

### Application localization
# Don't raise an InvalidLocale exception when the passed locale is not available
I18n.config.enforce_available_locales = false

# FastGettext settings
FastGettext.add_text_domain 'app', path: 'locale', type: :po
FastGettext.default_available_locales = Rails.application.config.i18n.available_locales
FastGettext.default_text_domain = 'app'

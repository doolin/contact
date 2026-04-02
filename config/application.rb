require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Contact
  class Application < Rails::Application
    config.load_defaults 8.1

    # Use a dummy secret_key_base for dev/test; production uses ENV.
    config.secret_key_base = ENV.fetch('SECRET_KEY_BASE') {
      'f18494cb6dcd5c9fe347626dba46e97e3fef632729caa74799af0b5e18e83eed2e789cf3ae2e3fe3ea33a45b4fa430fa0dae71e3b3acd3e44e799d7292e097fc'
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

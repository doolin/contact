require File.expand_path('../boot', __FILE__)

require 'rails/all'

#require 'action_mailer'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Contact
  class Application < Rails::Application

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

# From http://www.ruby-forum.com/topic/184533
# Trying to fix a "stack too deep" issue
#config.cache_classes = false
#config.cache_classes = true

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]
    #config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  end
end

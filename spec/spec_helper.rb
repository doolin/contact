# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'email_spec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Spec::Runner.configure do |config|
#   config.include(EmailSpec::Helpers)
#   config.include(EmailSpec::Matchers)
# end

RSpec.configure do |config|

  config.include FactoryBot::Syntax::Methods

  config.mock_with :rspec
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
Rails.env = 'test'

require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'capybara/rspec'
require 'database_cleaner'


# Capybara Configuration Options Here
# http://rubydoc.info/github/jnicklas/capybara/master/Capybara.configure
Capybara.configure do |cap|
  cap.ignore_hidden_elements = false
  cap.default_wait_time = 15
  cap.default_driver = :rack_test
end

Capybara.register_driver :poltergeist_debug do |app|
  options = { js_errors: false }
end


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  config.use_transactional_fixtures = false # Let DatabaseCleaner manage this so set to false
  config.use_transactional_examples = false
  config.color_enabled = true
  config.tty = true
  config.infer_base_class_for_anonymous_controllers = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = "random"
  config.include Capybara::DSL

  #database cleaner
  config.before(:suite) do
    p "Rails Env"
    p Rails.env
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end


end

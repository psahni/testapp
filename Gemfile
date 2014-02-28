source 'https://rubygems.org'


gem 'rails', '3.2.8'
gem "jquery-rails"
gem 'mysql2'



group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem "ejs", '1.1.1', :require => "ejs" # is a ruby port of uxnderscore templates. Think of it like ERB for javascript.
end

group :development do
  gem "wirble"
  gem "awesome_print"
end


gem 'jquery-rails'
gem 'jasminerice'
gem 'resque', :require => "resque/server"
gem 'execjs'
gem 'therubyracer'
gem 'backbone-on-rails'


gem 'passenger'
gem 'foodie',              :git => 'https://github.com/psahni/foodie.git'
gem 'custom_seed',         :git => 'https://github.com/psahni/custom_seed.git'
gem 'url_field_formatter', :git => 'https://github.com/psahni/url_field_formatter.git'
gem 'cache_digests'


# Rails Cache Store
gem 'rack-cache'   # sudo apt-get install memcached libmemcached-tools
gem 'dalli'        # This is a recommended memcached client

# faster kgio IO system:x
gem 'kgio'


#
# TEST ENV.
#
group :test do
  gem 'database_cleaner', "~> 0.9.1"
  gem 'launchy', '~> 2.2.0'
  gem 'webmock', '>= 1.8.0'
  gem 'vcr', '~> 2.4.0'
  gem 'rubyzip', '1.0.0' , :require => 'zip'
  gem "capybara", '~> 2.0.3'
  gem "poltergeist", '~> 1.1.0'
  gem 'simplecov', require: false
  gem 'spork', '~> 1.0rc'
end


group :development, :test do
  gem 'rspec-rails', "~> 2.12.2"
  gem 'factory_girl_rails', '~> 4.2.1'
  gem 'rb-fsevent', '>= 0.9'
  gem 'pry', '~> 0.9.12'
end

# Image Upload
gem 'carrierwave'
gem 'rmagick'
gem 'fog'
gem 'carrierwave_direct'


group :development do
  gem 'meta_request'
  gem 'friendly_id'
#  gem "better_errors"
#  gem 'binding_of_caller'
end
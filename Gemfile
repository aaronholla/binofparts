source 'https://rubygems.org'

gem 'rails', '4.2.0'

# Authentication
gem 'devise'
gem 'devise_invitable'

# Assets
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'

gem 'turbolinks'

gem 'jbuilder'

gem 'pg'
gem 'will_paginate'
gem 'event_tracker'
gem 'secure_headers'
#gem 'dragonfly', '~> 1.0.5'

# Continuous Integration
gem 'coveralls', require: false
gem "codeclimate-test-reporter", group: :test, require: nil

group :development do
  gem 'rails-dev-boost', :github => 'thedarkone/rails-dev-boost'
  gem 'thin'
  gem 'quiet_assets'
end

group :assets do
  gem 'asset_sync'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
end

group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem 'fuubar', '~> 2.0.0.rc1'
end

group :production do
  gem 'memcachier', '~> 0.0.2'
  gem 'newrelic_rpm', '~> 3.7.3'
  gem 'heroku-deflater', '~> 0.5.1'
  gem 'rails_12factor'
  gem 'unicorn'
end

# Use Capistrano for deployment
# gem 'capistrano', group: :development

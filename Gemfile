source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'

gem 'devise'
gem 'devise_invitable'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'pg'
gem 'will_paginate', '~> 3.0'
gem 'event_tracker'
#gem 'dragonfly', '~> 1.0.5'

group :development do
  gem 'rails-dev-boost', :github => 'thedarkone/rails-dev-boost'
  gem 'rb-inotify', '>= 0.8.8'
  gem 'thin'
  gem 'quiet_assets'
end

gem 'rspec-rails', '~> 3.0.0', :group => [:test, :development]
group :test do
  gem "factory_girl_rails"
  gem "capybara"
end

group :production do
  gem 'memcachier', '~> 0.0.2'
  gem 'newrelic_rpm', '~> 3.7.3'
  gem 'heroku-deflater', '~> 0.5.1'
  gem 'unicorn'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

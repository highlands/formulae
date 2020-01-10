# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'

# Simple Command is a gem that makes it easy to produce nice command-patterns
gem 'simple_command'

# Active Model Serializers helps us creating serializers for our API
gem 'active_model_serializers', '~> 0.10.10'

gem 'rails_admin'
# Devise - Log in -- using it with active admin
# https://github.com/plataformatec/devise/issues/4525
gem 'devise', '>= 4.7.1'
# Rack Cors
gem 'rack-cors', require: 'rack/cors'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '= 5.2.4'
# Postgres
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.1.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Rspec api documentation
gem 'rspec_api_documentation', '~> 6.1.0'
# apitome - documentation viewer at /api/docs
gem 'apitome', '~> 0.3.0'

# Ranked Model
gem 'ranked-model', '~> 0.4.4'

# Deployment gems
gem 'passenger'
gem 'capistrano', '~> 3.11.2'
gem 'capistrano-bundler', '~> 1.3'
gem 'capistrano-rails'
gem 'capistrano-rvm'
gem 'capistrano-passenger'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.3.5'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.9.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'haml-rails'
gem 'bootstrap'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'brakeman', require: false
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails', '~> 4.9.0'
  gem 'faker'
  gem 'rspec-rails', '~> 3.9.0'
end

group :production, :staging do
  gem 'rails_12factor'
end

group :development do
  gem 'better_errors'
  gem 'rubocop', require: false
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.2.1'
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'binding_of_caller'
end

group :test do
  gem 'shoulda-callback-matchers'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

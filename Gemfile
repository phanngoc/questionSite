source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

gem 'mysql2'

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '>= 3.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'bcrypt-ruby', '3.1.5', :require => 'bcrypt'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'omniauth'
gem 'friendly_id', '~> 5.1.0'
gem 'devise'
gem 'autoprefixer-rails'
gem 'seed_dump'
gem "bower-rails", "~> 0.11.0"
gem 'kaminari'
gem 'faker'
gem 'sidekiq'
#gem 'omniauth-facebook'
gem 'simple_form'
gem 'carrierwave', '~> 1.0'
gem 'pg'

gem 'cancancan'
gem 'select2-rails'
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

gem 'mini_magick'
gem 'ckeditor'
gem 'byebug'
gem 'gon'
gem 'react-rails'
gem 'font-awesome-sass'
gem 'ransack'
gem "i18n-js", ">= 3.0.0.rc11"
gem "will_paginate", "~> 3.1.0"
gem "config"

gem "groupdate"
gem "chartkick"

# group :development, :test do
#   # Call 'byebug' anywhere in the code to stop execution and get a debugger console
#   gem 'byebug', platform: :mri
# end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

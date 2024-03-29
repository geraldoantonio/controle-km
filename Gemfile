source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps https://github.com/amatsuda/kaminari/…
gem 'kaminari'
gem 'kaminari-i18n', '~> 0.5.0'

# Flexible authentication solution for Rails with Warden. http://blog.plataformatec.com.br/tag/…
gem 'devise'
# The authorization Gem for Ruby on Rails.
gem 'cancancan', '~> 2.0'

# Filterrific is a Rails Engine plugin that makes it easy to filter, search, and sort your ActiveRecord lists.
gem 'filterrific'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# jQuery UI for the Rails asset pipeline
gem 'jquery-ui-rails'
#
#Postgres Database
gem 'pg', '~> 0.18.4'

#Ruby probressbar in terminal for long running jobs
gem 'rake-progressbar'

# Progressive Web App
gem "serviceworker-rails"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Generate Entity-Relationship Diagrams for Rails applications http://voormedia.github.io/rails-erd/
  gem 'rails-erd'
  #MailCatcher runs a super simple SMTP server which catches any message sent to it to display in a web interface.
  gem 'mailcatcher'
  #Better error page for Rack apps
  gem 'better_errors'
  gem 'binding_of_caller'
  #RailsPanel is a Chrome extension for Rails development that will end your tailing of development.log. 
  gem 'meta_request'

end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

group :production do
  #Postgres database
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

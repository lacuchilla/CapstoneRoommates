source 'https://rubygems.org'

gem 'bootstrap-sass', '~> 3.3.6'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'bootstrap_form'
gem 'gretel'
gem 'money-rails'
gem 'rails', ">= 8.0.0"
# Use sqlite3 as the database for Active Record

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'pg', group: :production
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc'

gem 'omniauth'
gem 'omniauth-oauth2', '~> 1.3.1'

gem 'omniauth-twitter'
gem 'omniauth-facebook'

gem 'dotenv-rails', :groups => [:development, :test]

gem "codeclimate-test-reporter", group: :test, require: nil
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'whenever', :require => false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'pry'
  gem 'rails-erd'
  gem 'factory_bot_rails'
  gem 'vcr', '2.2.5'
  gem 'sqlite3'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
  gem "better_errors" # These two are just for debugging
  gem "binding_of_caller"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

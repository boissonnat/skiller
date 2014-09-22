source 'https://rubygems.org'

## Ruby / Rails
############################################################################################
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '1.9.3'
gem 'rails', '4.1.5'

## DATABASE
############################################################################################
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

## UI : bootstrap with SASS and FontAwesome
############################################################################################
gem 'bootstrap-sass', '~> 3.2.0'
gem 'sass-rails', '~> 4.0.3'
gem 'autoprefixer-rails'
gem 'font-awesome-sass', '~> 4.2.0'


## JS : uglifier, coffeescript, jquery-rails, turbolinks, JSON
############################################################################################
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'


## User management : devise
############################################################################################
gem 'devise', '3.2'
gem 'cancan', '1.6.10'
gem 'friendly_id', '~> 5.0.0'


## Development and Testing
############################################################################################
group :development, :test do
  gem 'rspec-rails', '3.0.1'
  gem 'factory_girl_rails', '4.4.1'
  gem 'rspec_junit_formatter'
end


group :test do
  gem 'faker', '1.4.0'
  gem 'capybara', '2.4.1'
  gem 'guard-rspec', '4.2.10'
  gem 'launchy', '2.4.2'
end

## Doc
############################################################################################
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]

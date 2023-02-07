source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"
gem "sassc-rails", "~> 2.1", ">= 2.1.2"
gem "sprockets-rails", "~> 3.4", ">= 3.4.2"
gem "active_model_serializers", "~> 0.10.13"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.0", ">= 6.0.2"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"

gem "rubocop-rails", "~> 2.17", ">= 2.17.4", require: false

# https://github.com/varvet/pundit
gem "pundit", "~> 2.3"

gem "jwt", "~> 2.6"

gem "bcrypt", "~> 3.1", ">= 3.1.18"

gem "countries", "~> 5.3"
gem "country_select", "~> 8.0", ">= 8.0.1"

gem "tzinfo", "~> 2.0", ">= 2.0.5"

gem "activeadmin", "~> 2.13", ">= 2.13.1"
gem "activeadmin_addons", "~> 1.9"
gem "devise", "~> 4.8", ">= 4.8.1"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "factory_bot_rails", "~> 6.2"
  gem "faker", "~> 3.1"
  gem "pry-coolline", "~> 0.2.6"
  gem "pry-nav", "~> 1.0"
  gem "pry-rails", "~> 0.3.9"
  gem "rspec-rails", "~> 6.0", ">= 6.0.1"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem "guard-rspec", "~> 4.7", ">= 4.7.3", require: false
end

group :test do
  gem "database_cleaner-active_record", "~> 2.0", ">= 2.0.1"
  gem "pundit-matchers", "~> 1.8", ">= 1.8.4"
end

gem "cssbundling-rails", "~> 1.1"

gem "jsbundling-rails", "~> 1.1"

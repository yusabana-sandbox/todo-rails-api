source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease.
# gem 'jbuilder', '~> 2.5' # Read more: https://github.com/rails/jbuilder
gem 'active_model_serializers', '~> 0.10.0' # https://github.com/rails-api/active_model_serializers
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  # Rspec
  gem 'rspec-rails', '~> 3.5'
  gem 'rspec-request_describer'
  gem 'rspec-json_matcher'
  gem 'factory_girl_rails'
  gem 'database_rewinder'
  gem 'rails-controller-testing'

  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'tapp-awesome_print'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'annotate', github: 'ctran/annotate_models'

  # API doc and spec and stub
  gem 'prmd', '0.11.4' # JSON Schema initializer and management tool
  gem 'committee'      # Rack middleware of Json Schema for validator and stub server
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

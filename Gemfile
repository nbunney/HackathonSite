source 'https://rubygems.org'

# Core Libs
gem 'rails', '~>4.2'
gem 'pg' # Postgres
gem 'puma' # Server

# Major Utilities
gem 'devise' # User Registration
gem 'omniauth' # Social Login
gem 'pundit' # Authorization
gem 'paperclip' # File attachments
gem 'geocoder' # Geocoding
gem 'friendly_id' # Slugs
gem 'rails_admin' # Lazy halfassed admin panel
gem 'counter_culture' # Advanced counter caches

# Minor Utilities
gem 'bootstrap_form'

# Template Stuff
gem 'slim-rails'
gem 'roadie-rails'
gem 'gon'

# Asset Pipeline
gem 'sprockets'
gem 'sprockets-es6', require: 'sprockets/es6' # Compile .es6 files with Babel
gem 'sass-rails'
gem 'autoprefixer-rails'
gem 'uglifier' # Compress JS

# Clientside Dependencies
gem 'font-awesome-rails'
gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'turbolinks'

# Documentation Generator
gem 'sdoc', group: :doc

group :development, :test do
  gem 'rack-mini-profiler' # Profile the app
  gem 'pry-rails' # Better Console
  gem 'spring' # Faster CLI
  gem 'rspec-rails' # Specs > Tests
  gem 'annotate' # Schema annotations inside model-related files

  # Guard handles responding to filesystem events
  gem 'guard'
  gem 'guard-rspec', require: false # Running specs
  gem 'guard-livereload', require: false # Reloading the page
  gem 'rack-livereload' # See above
  gem 'terminal-notifier-guard' # Announce to Notification Center
end


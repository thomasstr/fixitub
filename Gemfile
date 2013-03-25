source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :test, :development do
  gem 'sqlite3'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :admin do
  gem 'devise'
end

group :production do
  gem 'mysql2'
end

gem 'active_attr'
gem 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git" # Avatar bilder
gem 'cocaine' # Tilhører paperclip
gem 'metamagic' # Meta informasjon i siden
gem 'best_in_place' # Endrer kolonner med å trykke på dem
gem 'simple_form' # Gjør redigering av forms enklere
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'google-analytics-rails' # Statistikk over siden gjennom google analytics
gem 'letter_opener' # Åpne e-postutsendelser i nettleseren
gem 'cancan'
gem 'rolify'

gem "email_spec", :group => :test
gem "cucumber-rails", :group => :test, :require => false
gem "database_cleaner", :group => :test
gem "launchy",:group => :test
gem "capybara", :group => :test
gem "factory_girl_rails", :group => [:development, :test]
gem "better_errors", :group => :development
gem "binding_of_caller", :group => :development

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'debugger'

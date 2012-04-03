require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem "bson_ext", ">= 1.6.1"
gem "mongoid", ">= 2.4.7"
gem "omniauth", ">= 1.0.3"
gem "omniauth-linkedin"
gem "bootstrap-sass", ">= 2.0.1"
gem 'jquery-rails'
gem 'slim'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "slim-rails", ">= 0.3.4"
  gem "rspec-rails", ">= 2.9.0.rc2"
  gem "factory_girl_rails", ">= 3.0.0"
  gem "guard", ">= 0.6.2"
  gem "guard-bundler", ">= 0.1.3"
  gem "guard-rails", ">= 0.0.3"
  gem "guard-livereload", ">= 0.3.0"
  gem "guard-rspec", ">= 0.4.3"
  gem "guard-cucumber", ">= 0.6.1"
end

group :test do
  gem "rspec-rails", ">= 2.9.0.rc2"
  gem "database_cleaner", ">= 0.7.2"
  gem "mongoid-rspec", ">= 1.4.4"
  gem "machinist"
  gem "factory_girl_rails", ">= 3.0.0"
  gem "email_spec", ">= 1.2.1"
  gem "cucumber-rails", ">= 1.3.0"
  gem "capybara", ">= 1.1.2"
  gem "launchy", ">= 2.1.0"
end

group :production do
  gem 'pg'
end

case HOST_OS
  when /darwin/i
    gem 'rb-fsevent', :group => :development
    gem 'growl', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', :group => :development
  when /mswin|windows/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
end


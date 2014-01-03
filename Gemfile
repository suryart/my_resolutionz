source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use jdbcsqlite3 as the database for Active Record
if defined?(JRUBY_VERSION)
  gem 'jruby-openssl', '0.9.4'
  gem 'activerecord-jdbcmysql-adapter'
  gem 'therubyrhino_jar', '1.7.4'
  group :production do
    gem 'torquebox', '~> 3.0.1' 
    gem 'torquebox-server', '~> 3.0.1'
    # gem 'torquebox-capistrano-support', '~> 3.0.1'
  end
else
  gem 'mysql2', '0.3.11'
  # Use unicorn as the app server
  gem 'unicorn', :group => :production
end


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyrhino'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use bootstrap-sass for stylesheets
gem 'bootstrap-sass', '~> 3.0.3.0'

gem 'nprogress-rails', '0.1.2.3'
gem 'jquery-turbolinks'

# navigation:
gem 'navigasmic', '1.0.5'

# login and authentication:
gem 'devise', '3.2.2'
gem 'omniauth-facebook', '1.5.1'

# exceptions:
gem 'exception_notification', '4.0.1'

# for comments: https://github.com/the-teacher/the_comments
gem "the_comments", "~> 2.2.1"

gem 'slim', '2.0.2'                # or gem 'haml'
gem 'awesome_nested_set', '2.1.6'  # or same gem

# for assets attachment
gem 'carrierwave', '0.9.0'

gem 'kaminari', '0.15.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use Capistrano for deployment
group :development do
  gem 'capistrano', '3.0.1'
  gem 'capistrano-rails', '~> 1.1'
  # gem 'capistrano-bundler', '1.1.1'
end

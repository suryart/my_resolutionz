# Load Application configuration from system env
ENV['APP_CONFIG'] ||= File.expand_path('../app_config.rb', __FILE__)
if File.exists?(ENV['APP_CONFIG'])
  require ENV['APP_CONFIG']
end

# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails/tree/master/assets
#   https://github.com/capistrano/rails/tree/master/migrations
#
# require 'capistrano/rvm'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
# require 'capistrano/bundler'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'

require 'capistrano/rails'
# if defined?(JRUBY_VERSION)
#   require 'torquebox-capistrano-support'
# end

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }

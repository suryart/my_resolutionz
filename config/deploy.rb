set :application,   ENV['APPLICATION_NAME']
set :repo_url,      ENV['REPO_URL']
set :deploy_to,     "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :scm,           :git
set :scm_verbose,   true
set :use_sudo,      false
set :keep_releases, 5
set :deploy_via,    :remote_cache

# set :ssh_options, { port: ENV['SSH_PORT'] }

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
# set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end

# task :hello do
#   on roles(:app) do
#     puts "Running onto server from hello!"
#     execute "whoami"
#     execute "echo 'hello world' > /home/#{fetch(:user)}/hello"
#     info "Host #{host} (#{host.roles.to_a.join(', ')}):\t#{capture(:uptime)}"
#   end
# end

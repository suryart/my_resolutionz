set :stage,  :staging
set :branch, 'staging'
set :user,   ENV['CAP_STAGING_USER']
# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.

set :staging_app_ip, "#{ENV['CAP_STAGING_USER']}@#{ENV['CAP_STAGING_IP']}"
set :staging_web_ip, "#{ENV['CAP_STAGING_USER']}@#{ENV['CAP_STAGING_IP']}"
set :staging_db_ip, "#{ENV['STAGING_USERNAME']}@#{ENV['STAGING_HOST']}"

role :app, [staging_app_ip]
role :web, [staging_web_ip]
role :db,  [staging_db_ip]

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server ENV['CAP_STAGING_IP'], user: ENV['CAP_STAGING_USER'], roles: %w{web app}, port: ENV['SSH_PORT'], primary: true

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
# server 'stage.myresolutionz.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options

# fetch(:default_env).merge!(rails_env: :staging)

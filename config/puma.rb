rails_env = ENV['RAILS_ENV'] || 'development'
environment rails_env

daemonize
pidfile './tmp/pids/server.pid'
# logfile
puma_logfile = rails_env == 'production' ? './log/production.log' : './log/development-customer.log'
stdout_redirect puma_logfile, puma_logfile, true

threads 8,100
workers 3

# listen port
puma_port = rails_env == 'production' ? '8001' : '3000'
bind "tcp://0.0.0.0:#{puma_port}"
# bind 'unix:///var/run/puma.sock'
quiet

# config valid only for Capistrano 3.1
lock '3.4.0'

set :application, 'GaragePlayServer'
set :scm, :git
set :repo_url, "git@github.com:raphaelduartepinheiro/GaragePlayServer.git"
set :branch, "master"
# Default branch is :master
#ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/GaragePlayServer'
set :deploy_via, :copy
set :use_sudo, false
set :ssh_options, {:forward_agent => true}
# Default value for :scm is :git
set :user, "deployer"

set :keep_releases, 5
# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute "cd #{deploy_to}/current && bundle install && RAILS_ENV=production rake db:migrate && rails server thin -d -e production"
      #execute ""# && bundle install "
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc "Check that we can access everything"
      task :check_write_permissions do
        on roles(:all) do |host|
          if test("[ -w #{fetch(:deploy_to)} ]")
            info "#{fetch(:deploy_to)} is writable on #{host}"
          else
            error "#{fetch(:deploy_to)} is not writable on #{host}"
          end
        end
      end  

  desc "Check if agent forwarding is working"
  task :forwarding do
    on roles(:all) do |h|
      if test("env | grep SSH_AUTH_SOCK")
        info "Agent forwarding is up to #{h}"
      else
        error "Agent forwarding is NOT up to #{h}"
      end
    end
  end      

end

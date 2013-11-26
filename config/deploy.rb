#set :application, 'my_app_name' # TODO
set :application, 'newton' # TODO
#set :repo_url, 'git@example.com:me/my_repo.git' # TODO
set :repo_url, 'git@utrillo1:newton/newton.git' # TODO

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

#set :deploy_to, '/var/www/my_app' # TODO
set :deploy_to, '/home/ookawa/tmp/newton_test' # TODO
set :scm, :git

# set :format, :pretty
 set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      invoke 'unicorn:restart'
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

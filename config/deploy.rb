require "bundler/capistrano"
set :default_environment, {
 'PATH' => "$HOME/.rvm/gems/ruby-1.9.3-p374/bin:$HOME/.rvm/bin:/$HOME/.rvm/gems/ruby-1.9.3-p374/bin:$PATH",
}

server "192.81.209.30", :web, :app, :db, primary: true

set :application, "fixitub"
set :user, "deploy"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :rvm_ruby_string, '1.9.3-p374'
set :rvm_type, :user

set :scm, "git"
set :repository, "git@github.com:thomasstr/#{application}.git"
set :branch, "master"

set :rake, "/home/deploy/.rvm/bin/rake"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
    task :gems, :roles => :web, :except => { :no_release => true } do
      run "cd #{current_path}; #{shared_path}/bin/bundle unlock"
      run "cd #{current_path}; nice -19 #{shared_path}/bin/bundle install vendor/" # nice -19 is very important otherwise DH will kill the process!
      run "cd #{current_path}; #{shared_path}/bin/bundle lock"
    end
  end
  before "deploy:restart", "bundle:install"
  
  namespace :db do
    desc "Populate the database with seed data"
    task :seed do
        run "cd #{current_path}; rake db:seed RAILS_ENV=production"
      end
    desc "Resets the Production Database"
    task :migrate_reset do
      puts "\n\n=== Resetting the Production Database! ===\n\n"
      run "cd #{current_path}; rake db:migrate:reset RAILS_ENV=production"
    end
    
    desc "Destroys Production Database"
    task :drop do
      puts "\n\n=== Destroying the Production Database! ===\n\n"
      run "cd #{current_path}; rake db:drop RAILS_ENV=production"
      system "cap deploy:set_permissions"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end

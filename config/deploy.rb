=begin set :application, "set your application name here"
set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "your web-server here"                          # Your HTTP server, Apache/etc
role :app, "your app-server here"                          # This may be the same as your `Web` server
role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
=end

#require 'bundler/capistrano'
#require 'rake/dsl_definition'

require 'rake/dsl_definition'
require 'rake'

set :user, 'root'
set :password, "N9haF7NM"
set :domain, '184.107.213.34'
#set :port, 3020
#set :rake, "/usr/local/bin/rake"
set :scm, 'git'
set :repository,  "git@github.com:akankshita/carsurvey.git"
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :application, "carsurvey"
#set :default_environment,{"PATH" => "$PATH:/usr/lib/ruby/gems/1.8/bin/"}
set :shell, '/bin/bash'
# roles (servers)
role :web, '184.107.213.34'
role :app, '184.107.213.34'
role :db,  '184.107.213.34', :primary => true
 
# deploy config
set :deploy_to, "/home/projects/public_html/demo_projects/ror/#{application}"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true
# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/home/user/.ssh/id_rsa)            # If you are using ssh_keysset :chmod755, "app config db lib public vendor script script/* public/disp*"set :use_sudo, false
# Passenger


namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :bundle_install, :roles => :app do
    run "cd #{current_path} && LC_ALL='en_US.UTF-8' bundle install --deployment --without test"
  end
  desc "rake db create"
  task :rake_db_create, :roles => :app do
    run "cd #{current_path} && rake db:create"
  end
  
  desc "rake db migrate"
  task :rake_db_create, :roles => :app do
    run "cd #{current_path} && rake db:migrate"
  end
  desc "run application"
  task :rake_db_create, :roles => :app do
    run "cd #{current_path} && rails s"
  end   
  
end
before "deploy:restart", "deploy:bundle_install"

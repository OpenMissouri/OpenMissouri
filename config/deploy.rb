set :application, "openmissouri"
set :repository,  "git@github.com:blueroot/OpenMissouri.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "deploy"
set :use_sudo, false
set :deploy_to, "/var/www/apps/#{application}"
set :deploy_via, :remote_cache

role :web, "staging.openmissouri.org"                           # Your HTTP server, Apache/etc
role :app, "staging.openmissouri.org"                           # This may be the same as your `Web` server
role :db,  "staging.openmissouri.org", :primary => true         # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:restart"

desc "Utilize after update code hook to link to the proper database.yml"
task :after_update_code, :roles => [:app] do
	database_config = "#{shared_path}/database.yml"
	run "ln -nfs #{database_config} #{release_path}/config/database.yml"
end


# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :bundle_gems do 
    run "cd #{deploy_to}/current && bundle install --path vendor/gems"
  end
  
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
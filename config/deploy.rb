default_run_options[:pty] = true

set :application, "clients.dezmondfinney.com"
set :repository, "git@github.com:wickedtribe/SistasAtlanta.git"

set :scm, "git"

role :web, application                         # Your HTTP server, Apache/etc
role :app, application
role :db,  application, :primary => true # This is where Rails migrations will run

ssh_options[:forward_agent] = true

set :branch, "master"
set :deploy_via, :remote_cache
params[:id]
# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start {}
  task :stop {}
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
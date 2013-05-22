

server "96.31.88.143", :app, :web, :db, :primary => true
set :deploy_to, "/var/rails/apps/#{application}"
set :use_sudo, false
server "staging.cecropiasolutions.com", :app, :web, :db, :primary => true
set :branch, "master"
set :deploy_to, "/var/www/staging.cecropiasolutions.com"

require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride 
#Reminder: Remember to add the use Rack::MethodOverride to your config.ru file 
#so that your app will know how to handle PATCH, PUT, and DELETE requests!

run ApplicationController

require './config/environment'
require './app/controllers/application_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


run ApplicationController
#Reminder: Remember to add the use Rack::MethodOverride to your config.ru file
#so that your app will know how to handle patch and delete requests!
use Rack::MethodOverride

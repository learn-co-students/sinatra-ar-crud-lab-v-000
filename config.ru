require './config/environment'
require './app/controllers/application_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride  #your app will know how to handle patch and delete requests

run ApplicationController

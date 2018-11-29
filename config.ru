require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
<<<<<<< HEAD

run ApplicationController
=======
run ApplicationController
>>>>>>> 9c6464d9607186bb92210f4fcc4f928725d5ad16


require './config/environment'

begin
  fi_check_migration

# app will know how to handle PATCH, PUT, and DELETE requests with code in line directly below
  use Rack::MethodOverride

  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end

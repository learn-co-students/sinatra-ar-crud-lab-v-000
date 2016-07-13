ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'
require './app/controllers/application_controller'



# Type `rake -T` on your command line to see the available rake tasks.

#task :console do
#  IRB.start
#end

task :console do
  require 'irb'
  ARGV.clear
  IRB.start
end
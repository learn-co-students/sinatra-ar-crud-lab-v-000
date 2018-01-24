require 'pry' 
require 'active_record'
require_relative './config/environment'

def reload!
   load "./app/models/post.rb" 
end

require_relative "./app/models/post.rb"

Pry.start

require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do 
    # "This works!"
    erb :new
  end
  
  post '/articles' do
    binding.pry
    erb :show
  end
  
end

require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    "hello blog"
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    "#{params}"
  end

end
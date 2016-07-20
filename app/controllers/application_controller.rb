require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Hello World"
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    erb :posts
  end
end

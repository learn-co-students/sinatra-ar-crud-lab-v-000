require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
  	erb :new
  end

  post '/posts' do
  	@new_post = Post.create(params)
  	erb :index
  end

  get '/' do 
    erb :index
  end

end
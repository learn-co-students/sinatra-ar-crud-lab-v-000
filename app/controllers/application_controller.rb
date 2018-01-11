require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    erb :index  
  end

  get '/post/new' do
    erb :new
  end

  post '/posts' do
    p params
    @post = Post.create(params[:post])
  end

end



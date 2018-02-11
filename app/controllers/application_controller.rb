require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    "Welcome to my blog!"
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])

    if @post
      erb :show 
    else
      not_found
    end
  end

  not_found do
    "That resource does not exist!"
  end
end
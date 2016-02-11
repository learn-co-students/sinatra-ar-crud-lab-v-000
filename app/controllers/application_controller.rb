require_relative '../../config/environment'
require_relative '../models/post'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    @posts = Post.all
    erb :index
  end
  get "/posts" do 
    @posts = Post.all
    erb :index
  end
  get "/posts/new" do 
    erb :new
  end
  post "/posts" do
    Post.create(params)
    @posts = Post.all
    erb :index
  end
end
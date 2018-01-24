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
  get "/posts/:id" do
    @post = Post.find(params[:id])
    @show_edit_button = true
    erb :show 
  end
  get "/posts/:id/edit" do 
    @post = Post.find(params[:id])
    erb :edit
  end
  post "/posts" do
    Post.create(params)
    @posts = Post.all
    erb :index
  end
  patch "/posts/:id" do 
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end
  delete "/posts/:id/delete" do 
    @post = Post.find(params[:id])
    @post.destroy
    redirect to("/posts")
  end
end
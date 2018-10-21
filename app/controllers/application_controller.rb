
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
#create
  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    @posts = Post.all
    erb :index
  end
#read
  get '/posts' do
    @posts = Post.all
    erb :index
  end
#(+delete)
  get "/posts/:id" do
    @post = Post.find(params[:id])
    erb :show
  end
#Update
  get "/posts/:id/edit" do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end
#delete
  delete '/posts/:id/delete' do
    Post.destroy(params[:id])
    # @posts = Post.all
    # erb :index
  end




end

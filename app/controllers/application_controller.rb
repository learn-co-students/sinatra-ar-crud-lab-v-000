
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  delete '/posts/:id/delete' do
    #binding.pry
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete
  end

  get '/posts/:id' do
    #binding.pry
    @post = Post.find(params[:id])
    erb :show
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    #redirect_to '/posts/#{@post.id}'
    erb :show
  end

  post "/posts" do
    #binding.pry
    Post.create(params)
    @posts = Post.all
    erb :index
  end

end

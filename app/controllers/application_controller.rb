require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    "Welcome!"
  end

  get '/posts/new' do 
    erb :new
  end

  post '/posts' do
    # binding.pry 
    @posts = Post.create(params)
    @posts.save
    @posts = Post.all
    erb :index
  end

  get '/posts' do 
    @posts = Post.all
    # binding.pry
    erb :index
  end

  get '/posts/:id' do 
    # binding.pry
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit 
  end

  patch '/posts/:id' do 
    @post = Post.find(params[:id])
    @post.update(name: params[:name],content: params[:content])
        # binding.pry
    erb :show
  end

  delete '/posts/:id/delete' do 
    @post = Post.find(params[:id])
    @post.destroy
    redirect '/posts'
  end
end
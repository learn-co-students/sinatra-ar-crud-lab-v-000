require_relative '../../config/environment'

require 'sinatra/base'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do 
    erb :new 
  end

  get '/posts' do 
    # Post.create(params)
    @posts = Post.all
    erb :index 
  end 

  post '/posts' do
    Post.create(params)
    @posts = Post.all
    # binding.pry
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end 

  patch '/posts/:id' do 
    # binding.pry
    @post = Post.find(params[:id])
    @post.update(name: params[:name])
    @post.update(content: params[:content])
      erb :show
    # binding.pry 
  end

  delete '/posts/:id/delete' do 
    # binding.pry 
    @post = Post.find(params[:id]) 
    @post.delete
    erb :delete
  end



end
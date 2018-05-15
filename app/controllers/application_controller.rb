require 'pry'
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
    Post.create(name: params[:name], content: params[:content])
     
      redirect to '/posts'
  end 
  
  get '/posts' do 
    @posts = Post.all
    erb :index
  end 
  
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end 
  
  get '/posts/:id/edit' do 
   # binding.pry
      @post = Post.find(params[:id])
    erb :edit 
  end
  
  patch '/posts/:id' do 
    #binding.pry
      @post = Post.find_by id: params[:id]  
      @post.update(name: params[:name], content: params[:content])
      erb :show
    end 
    
    delete '/posts/:id/delete' do 
    @post = Post.find(params[:id])
    @post.delete 
    erb :delete
    end
    
  end 


require_relative '../../config/environment'
require "pry"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :home
  end
  
  get '/posts' do 
    @posts = Post.all
    
    erb :index
  end
  
  get '/posts/new' do 
    erb :new 
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    
    erb :edit 
  end
  
  get '/posts/:id' do 
    @post = Post.find_by_id(params[:id])
    
    erb :show 
  end 
  
  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
     
    redirect '/posts'
  end
  
  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.update(name: params[:name], content: params[:content])
    
    erb :show 
  end
  
  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.destroy
    erb :delete 
  end
  
end

require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/posts' do
    @posts = Post.all
    erb:'index'
  end  
  
  post '/posts' do
    atts={}
    atts[:name] = params["name"]
    atts[:content] = params["content"]
    
    Post.create(atts)
    redirect '/posts'
  end
  
  get '/posts/new' do
    erb:'new'
  end
  
  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb:'show'
  end
  
  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb:'edit'
  end  
  
  patch '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    @post.name = params["name"]
    @post.content = params["content"]
    @post.save
    redirect "/posts/" + params[:id]
  end
  
  delete '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @post.delete
    erb:'deleted'
  end
  
end
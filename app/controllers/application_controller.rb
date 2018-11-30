
require_relative '../../config/environment'
require_relative '../models/post.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
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
    @post = Post.find_by_id(params[:id])
    erb :show
  end 
  
  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end 
    

  patch '/posts/:id' do  #updates a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end


  delete '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect to '/posts'
  end
    
end 
#>>>>>>> 9c6464d9607186bb92210f4fcc4f928725d5ad16

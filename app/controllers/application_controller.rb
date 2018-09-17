
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :new
  end
  
  get '/posts/new' do
    erb :new
  end
  
  post '/posts' do
    params[:user_input]
    Post.create(name: params[:name], content: params[:content])
    # binding.pry
    erb :index
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
    @post = Post.find(params[:id])
    
    erb :edit
  end
  
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    Post.update(name: params[:name], content: params[:content])
    
    redirect to "/posts/#{@posts.id}"
  end
  
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    
    erb :delete
  end
  
end


require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  
    
  get '/posts' do
    #get all posts
    
    @posts = Post.all
    erb :index
  end
  

  get '/posts/new' do 
    erb :new
  end
  
  post '/posts' do
    Post.create(params)
    redirect '/posts'
  end
  
  get '/posts/:id' do 
    @post = Post.find(params[:id])
    erb :show
  end 
  
  get '/posts/:id/edit' do 
    # raise params.inspect
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do 
    # "patch"
    id = params[:id]
    og_post = Post.find(id)
    up_hash = {}
    up_hash[:name] = params[:name]
    up_hash[:content] = params[:content]
    og_post.update(up_hash)
    
    redirect "/posts/#{id}"
  end
  
  
  delete '/posts/:id/delete' do
    @post = Post.find(params["id"])
    @post.destroy
    erb :delete
  end


end

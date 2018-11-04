require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
  end
  
  get '/posts/new' do
    erb :new
  end
  
  get '/posts' do
    @posts = Post.all
    
    erb :index
  end
  
  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
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
    @post = Post.update(name: params[:name], content: params[:content])
    
    redirect "/posts/#{params[:id]}"
  end
  
  delete '/posts/:id/delete' do
    Post.find(params[:id]).destroy
    
    erb :delete
  end
  
end

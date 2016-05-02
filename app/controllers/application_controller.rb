require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do     
  end

  get '/posts' do 
    @posts = Post.all
    @deleted = nil
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do 
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do 
    @post = Post.find(params[:id])
    erb :edit
  end

  post '/posts' do 
    Post.create(params)
    @posts = Post.all
    @deleted = nil
    erb :index
  end

  patch '/posts/:id' do 
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do 
    @deleted = Post.find(params[:id]).name
    Post.destroy(params[:id])
    @posts = Post.all 
    erb :index 
  end
end


require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/posts'
  end

  # Create
  get '/posts/new'do
    erb :new
  end

  post '/posts' do
    Post.new(params).save
    redirect '/posts'
    # erb :index
  end

  # Retrieve
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  # Update
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name=params[:name]
    @post.content=params[:content]
    @post.save
    redirect '/posts/'+params[:id]
  end

  # Delete (from Show id page)
  delete '/posts/:id/delete' do
    Post.delete(params[:id])
    redirect '/posts'
  end
end

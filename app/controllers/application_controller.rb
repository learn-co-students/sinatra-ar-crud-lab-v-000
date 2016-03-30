require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Create
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    erb :index
  end

  # Read all posts
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  # Read individual post
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  # Update
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  #Update
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "/posts/#{params[:id]}"
  end

  # Delete
  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect '/posts'
  end

end
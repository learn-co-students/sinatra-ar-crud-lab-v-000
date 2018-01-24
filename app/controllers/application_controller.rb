require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
  end

  # New
  get '/posts/new' do
    erb :new
  end

  # Create
  post '/posts' do
    @post = Post.create(params)
  end

  # ALl
  get '/posts' do
    @posts = Post.all
    erb :index
  end
  
  # Show
  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  # Edit
  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  #Update
  post '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
  end

  # Delete
  post '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
  end
end
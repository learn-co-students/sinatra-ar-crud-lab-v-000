require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Load index page - all posts
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  # Load new form
  get '/posts/new' do
    erb :new
  end

  # Create a post
  post '/posts' do
    post = Post.new
    post.name = params[:name]
    post.content = params[:content]
    post.save

    redirect to '/posts'
  end

  # Loads a specific post
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  # Loads edit form
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  # Updates a post
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  # Delete a post
  delete '/posts/:id/delete' do
    post = Post.find(params[:id])
    @name = post.name
    post.destroy
    erb :delete
  end
end

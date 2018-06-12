
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @allposts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts'  do
    # binding.pry
    Post.create(name: params[:name], content: params[:content])
    # binding.pry
    redirect "/posts"
  end

# show
  get '/posts/:id' do
    # binding.pry
    @post = Post.find_by_id(params[:id])
    erb :show
  end

# check post order

# displays edit form
  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

# edits a post
  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
  end




end

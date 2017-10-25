require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  ### CREATE ###

  # The get '/model/new' route loads the new form
  get '/posts/new' do
    erb :new
  end

  # POST to posts, create new Post object from params, display index
  post '/posts' do
    @post = Post.create(params)
    erb :show
  end

  ### READ ###

  # Load the index page
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  # Load the show page
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  ### UPDATE ###

  # Load the edit form
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  # Edit/Update the post
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  ### DELETE ###

  # Delete the post
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :delete
  end


end

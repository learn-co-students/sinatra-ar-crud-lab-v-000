require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #CREATE. Renders 'NEW' form.
  get '/posts/new' do
    erb :new
  end

  # Takes data from 'NEW' form and instantiates.
  post '/posts' do
    @post = Post.create(params)
    redirect '/posts'
  end

  # Shows All previous posts.
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  # Shows a Specific Instance.
  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  #UPDATE. Loads editing form.
  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  #UPDATE. Saves updated post.
  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  #DELETE.
  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :delete
  end
end

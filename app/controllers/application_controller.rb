require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  patch '/posts/:id' do #update
    @post = Post.find(params[:id])
    @post.update(name: params["name"], content: params["content"])
    redirect "/posts/#{@post.id}"
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    redirect '/posts'
  end

  get '/posts/:id' do #show
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  delete '/posts/:id/delete' do 
    # binding.pry
    Post.find(params[:id]).destroy
    redirect '/posts'
  end





end
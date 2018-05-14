
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :'index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    # binding.pry
    Post.create(params)
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts' do
    @posts = Post.all
    # binding.pry
    erb :'posts/index'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'posts/edit'
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :'posts/show'
  end

  delete '/posts/:id/delete' do
    # binding.pry
    @post = Post.find(params[:id])
    @post.delete
    redirect '/posts'
  end
end

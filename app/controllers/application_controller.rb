require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @posts = Post.all
    @posts << Post.create(params[:post])
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    @post.update(name: params["post"]["name"], content: params["post"]["content"])
    erb :index
  end

  delete '/posts/:id/delete' do
    Post.delete(params[:id].to_i)
    @posts = Post.all
    redirect to('/posts')
  end

end

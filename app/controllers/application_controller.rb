require_relative '../../config/environment'
require 'pry'

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
    new_post = Post.create(params)
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params["id"])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params["id"])
    #binding.pry
    erb :edit
  end

  patch '/posts/:id' do
    @posts = Post.all
    #binding.pry
    update_these = {"name" => params["name"], "content" => params["content"]}
    @post = Post.update(params["id"], update_these)

    erb :show
  end

  delete '/posts/:id/delete' do

    binding.pry
    post = Post.find(params["id"])


    post.destroy
  end
end

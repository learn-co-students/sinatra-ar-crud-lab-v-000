require 'sinatra/base'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do

    post = Post.new(params)
    post.save
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    # binding.pry
    @post = Post.find(params[:id])
    erb :show
  end
  # failing
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    # binding.pry
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params.fetch("id"))
    # binding.pry
    @post.name = params.fetch("name")
    @post.content = params.fetch("content")
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params.fetch("id"))
    @post.destroy

    erb :delete
  end
end

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
    @post = Post.create(params)
    @post.save
    @posts = Post.all
    #binding.pry
    erb :index
  end

  get '/posts' do
    #binding.pry
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.all.find params[:id]
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.all.find params[:id]
    erb :edit
    #binding.pry
  end

  patch '/posts/:id' do
    binding.pry
    @post.update(params)
  end

end

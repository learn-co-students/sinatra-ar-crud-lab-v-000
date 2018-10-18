
require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "hello"
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
  #  binding.pry
    @post=Post.create(name: params[:name], content: params[:content])
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get 'posts/:id' do
    @post = Post.find_by_id(param[:id])
    erb :show
  end




end

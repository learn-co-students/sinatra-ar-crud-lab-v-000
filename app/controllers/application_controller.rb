require_relative '../../config/environment'

require 'sinatra/base'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do 
    erb :new 
  end

  get '/posts' do 
    # Post.create(params)
    @posts = Post.all
    erb :index 
  end 

  post '/posts' do
    Post.create(params)
    @posts = Post.all
    # binding.pry
    erb :index
  end

  get 'posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end


end
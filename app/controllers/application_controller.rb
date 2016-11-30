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
    binding.pry
    erb :index
  end

  get '/posts' do
    #binding.pry
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @posts = Post.all
    @post = @posts.select do
      |post| post.name == params[:id]
    end
    #binding.pry
    erb :show
  end

end

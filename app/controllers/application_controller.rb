
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
    #binding.pry
  end

  post '/posts' do
    post = Post.new(params[:post])
    #binding.pry
    post.save
    redirect to '/posts'

  end

  get '/posts' do
    @posts = Post.all
    #binding.pry
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end


end

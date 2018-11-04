
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do

    erb :new
  end

  post '/posts' do
    # binding.pry
    Post.create(params)

    erb :index
  end

  get '/posts' do
    # get ALL posts and render on index via @posts
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    # find a post and display it
    @post = Post.find(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

end

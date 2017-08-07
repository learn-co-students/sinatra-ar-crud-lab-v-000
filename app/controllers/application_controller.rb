require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


# CRUD - create post Post
  # The Read CRUD action corresponds to two different controller actions: show and index. The show action should render the erb view show.erb, which shows an individual post. The index action should render the erb view index.erb, which shows a list of all of the posts.



  get '/' do
  "Hi"

  end

  get '/posts/new' do
    # binding.pry
    # raise "hi".inspect
    erb :new
  end

  post '/posts' do
    # @post = Post.create(name: params[:name], content: params[:content])
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do  #load index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    erb :show

  end

  delete '/posts/:id/delete' do
  @post = Post.find_by_id(params[:id])
  @post.delete

  erb :delete
  end

end

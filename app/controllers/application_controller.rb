
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # read all and delete form
  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  # create form
  get '/posts/new' do
    erb :'posts/new'
  end

  # create
  post '/posts' do
    Post.create(params)
    redirect to '/posts'
  end

  # read
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'posts/show'
  end

  # update form
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'posts/edit'
  end

  # update
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :'posts/show'
  end

  # delete
  delete '/posts/:id/delete' do
    Post.find(params["id"]).delete
    @posts = Post.all
    erb :'posts/index'
  end

end

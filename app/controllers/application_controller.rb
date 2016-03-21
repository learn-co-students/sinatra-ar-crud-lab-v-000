require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  # create
  get '/posts/new' do
    erb :'/post/new'
  end

  post '/posts' do
    # this should probably be find_create_by
    Post.find_or_create_by(params[:post])
    # @posts = Post.all
    erb :'/post/index'
  end

  # read
  get '/posts' do
    @posts = Array.new(Post.all)
    erb :'/post/index'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'/post/show'
  end

  # update
  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :'/post/edit'
  end

  patch '/posts/:id' do |id|
    post = Post.find_by_id(id)
    post.update(params[:post])
    erb :'/post/show'
  end

  # delete
  delete '/posts/:id/delete' do |id|
    @deleted_post = Post.find_by_id(id).delete
    erb :'/post/delete'
  end
end

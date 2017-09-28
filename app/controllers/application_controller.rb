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
    @post = Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post 'posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    # @post.update(name: params[:name], content: params[:content])
    @post.save
    redirect to '/posts/:id'
  end 

  get 'posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  delete 'posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.destroy
    erb :deleted
  end
  
end
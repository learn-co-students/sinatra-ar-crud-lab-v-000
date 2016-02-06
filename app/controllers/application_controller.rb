require_relative '../../config/environment'
require_relative '../models/post.rb'
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
    Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
  end

  post '/posts/:id' do  #updates a post
    @post = Post.find_by_id(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :show
  end

  post '/posts/:id/delete' do
    @post = Post.find(params[:id].to_i)
    @post.destroy
    redirect to '/posts'
  end

end
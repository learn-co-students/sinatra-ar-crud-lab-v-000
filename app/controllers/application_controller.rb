require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  post '/posts' do
    post = Post.new(params)
    post.save
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    post = Post.find_by(id: params[:id])
    post.update(name: params[:name], content: params[:content])
    #binding.pry
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  delete '/posts/:id/delete' do
    post = Post.find_by(id: params[:id])
    @post_name = post.name
    post.destroy
    "#{@post_name} was deleted"
  end

end

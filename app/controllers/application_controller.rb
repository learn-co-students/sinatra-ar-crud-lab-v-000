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
    Post.create(name: params["name"], content: params["content"])
    #binding.pry
    erb :index
  end

  get '/posts' do
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    #binding.pry
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    #binding.pry
    @post.update(name: params["name"], content: params["content"])
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @post_name = @post.name
    #binding.pry
    @post.destroy
    erb :delete
  end

end

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
    erb :posts 
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by id: params[:id]
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by id: params[:id]
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by id: params[:id]
    values = {id: params[:id], name: params[:name], content: params[:content]}
    @post.update(values)
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.destroy
    redirect to '/posts'
  end

end
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/' do 
   erb :index
  end

  get'/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
     redirect '/posts'
  end

  get '/posts' do
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
    #raise "STOP"
    @post = Post.find_by_id(params[:id])
    @post.content = params[:content]
    @post.name = params[:name]
    @post.save
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect "/posts" 
  end
end
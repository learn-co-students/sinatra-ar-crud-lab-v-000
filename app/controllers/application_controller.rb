
require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post1 = Post.create(params)
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post2 = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.update(params[:id], {:name => params[:name], :content => params[:content]})
    erb :show
  end

  delete '/posts/:id/delete' do
    Post.delete(params[:id])
    erb :delete
  end



end

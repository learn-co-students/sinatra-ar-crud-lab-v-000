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
    Post.create(params)
    #@posts = Post.all
    redirect_to :'/posts'
    #erb :index
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
    @post = Post.find(params[:id])
    erb :edit

  end

  patch '/posts/:id' do
    Post.find(params[:id]).update(name:params['name'],content:params[:content]).save
    binding.pry
    redirect_to :'/posts/:id'
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id]).name
    Post.find(params[:id]).destroy
    erb :delete
  end


end

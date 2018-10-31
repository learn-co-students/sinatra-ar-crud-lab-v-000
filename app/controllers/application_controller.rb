
require_relative '../../config/environment'

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

  get '/posts/:id' do
    #binding.pry
    @post = Post.find(params[:id].to_i)
    erb :show
  end

  post '/posts' do
    post = Post.new(params)
    post.save
    @all = Post.all

    erb :index
  end

  get '/posts' do
    @all = Post.all
    erb :index
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    @all = Post.all
    erb :index
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    @all = Post.all
    erb :index
  end

end

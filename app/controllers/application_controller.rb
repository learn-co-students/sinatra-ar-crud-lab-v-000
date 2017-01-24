require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  # CREATE
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(name:params[:name], content:params[:content])
    erb :index
  end

  # READ - all instances of model
  get '/posts' do
    @posts = Post.all
    binding.pry
    erb :index
  end

  # READ - specific instance of model
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  # UPDATE
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update(name: params[:name], content: params[:content])
    post.save

    redirect to "/posts/#{post.id}"
  end

  # DELETE
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :deleted
  end
end

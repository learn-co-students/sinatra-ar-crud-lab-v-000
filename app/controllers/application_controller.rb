
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all  #grabs all posts and stores in instance variable

    erb :index
  end

  get '/posts/:id' do

    @post = Post.find(params[:id])

    erb :show
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    @posts = Post.all

    erb :index
  end

  get '/posts/:id/edit' do

    @post = Post.find(params[:id])

    erb :edit
  end

  patch '/posts/:id' do #finds the instance of the model to update using the id from params, update and save the instance
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
  end
end

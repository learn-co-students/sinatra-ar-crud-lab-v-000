require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end
  get '/posts' do
    @posts = Post.all
    erb :index
  end
  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    @posts = Post.all
    erb :index
  end
  get '/posts/new' do
    erb :new_post
  end
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :post
  end
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :post
  end
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end
  delete '/posts/:id/delete' do
    name = Post.find(params[:id]).name
    Post.find(params[:id]).delete
    "#{name} was deleted"
  end
end

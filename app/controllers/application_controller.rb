
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#-----------CREATE --CRUD--
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    #erb :index
    redirect to '/posts'
  end

#-----------READ --CRUD--
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

#-----------UPDATE --CRUD--
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post = Post.update(name: params[:name], content: params[:content])
    erb :show
  end

#-----------DELETE --CRUD--

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete
  end
end

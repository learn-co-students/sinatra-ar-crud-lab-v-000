
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
#----Create
get '/posts/new' do
    erb :new
  end

  post '/posts' do#---create
    @post = Post.create(name: params[:name], content: params[:content])
    erb :index
  end
#----Read
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by id: params[:id]
    erb :show
  end
#---Update
  get '/posts/:id/edit' do
    @post = Post.find_by id: params[:id]

    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by id:(params[:id])
    @post.update(name: params[:name], content: params[:content])
    @post.save
    erb :show
  end
# ----Delete
  delete '/posts/:id/delete' do
    @post = Post.find_by id: params[:id]
    @post.delete
    erb :delete
  end
end

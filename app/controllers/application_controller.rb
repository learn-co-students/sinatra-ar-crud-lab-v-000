require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(name: params["name"], content: params["content"])
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    @deleted = Post.deleted
    erb :index
  end

  get '/posts/:id' do
    @post = Post.all.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.all.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.all.find_by_id(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.all.find_by_id(params[:id])
    @post.add_to_deleted
    @post.delete
    redirect '/posts'
  end
end

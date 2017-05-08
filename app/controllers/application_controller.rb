require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/posts/new' do
    erb :"../views/new"
  end

  post '/posts' do
    @post = Post.create(params)
    erb :"../views/show"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :"../views/show"
  end

  get '/posts' do
    @posts = Post.all
    erb :"../views/index"
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :"../views/edit"
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update("name" => params[:name], "content" => params[:content])
    erb :"../views/show"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post_name = @post.name
    @post.destroy
    erb :delete
  end
end

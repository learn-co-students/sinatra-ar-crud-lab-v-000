require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #CREATE
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    redirect to "/posts"
  end

  #READ
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  #UPDATE
  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  #DELETE
  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :delete
  end

end

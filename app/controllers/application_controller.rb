require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  get '/posts' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find(@params[:id].last)
    erb :post
  end

  get '/posts/:id/edit' do
    @post = Post.find(@params[:id].last)
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.content = params[:content]
    @post.name = params[:name]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(@params[:id])
    @post.delete
     erb :delete
  end




end

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

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :post
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    puts params[:id]
    Post.update(params[:id], {name: params[:name], content: params[:content]})
    @post = Post.find(params[:id])
    erb :post
  end

  post '/posts' do
    puts params
    Post.create(params)
    @posts = Post.all
    erb :index
  end

  delete '/posts/:id/delete' do
    puts params[:id]
    @post = Post.find(params[:id])
    Post.delete(params[:id])
    erb :deleted
  end

end

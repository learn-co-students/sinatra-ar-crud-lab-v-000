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
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    puts @post.name
    erb :edit
  end

  post '/posts' do
    @posts = Post.create(name: params[:post_name], content: params[:post_content])
    erb :post
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:post_name], content: params[:post_content])
    puts @post.name
    puts @post.content
    erb :post/:id
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    Post.find(params[:id]).destroy
    erb :delete
  end

end

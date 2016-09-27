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

  get '/posts/:id/edit' do
    erb :edit
  end

  delete '/posts/:id/delete' do
    post = Post.find(params[:id])
    @name = post.name
    post.delete
    erb :deleted
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end


  patch '/posts/:id' do
    post = Post.find(params[:post][:id].to_i)
    post.name = params[:post][:name]
    post.content = params[:post][:content]
    post.save
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    post = Post.new(params[:post])
    post.save
    @posts = Post.all
    erb :index
  end

end

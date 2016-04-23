require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    @posts = Post.all
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
    #binding.pry
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    redirect to('/posts')
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.update(id: params[:id], name: params[:name], content: params[:content])
    erb :show
  end

  post '/posts/:id/delete' do
    Post.delete(params[:id])
    redirect to('/posts')
  end

end

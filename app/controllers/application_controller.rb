require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Dummy Page"
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  get '/posts' do
    @post= Post.all
    erb :index
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
    @ogpost = Post.find(params[:id])
    @ogpost.update(name: params[:name], content: params[:content])
    redirect to '/posts/2'
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :delete
  end
end

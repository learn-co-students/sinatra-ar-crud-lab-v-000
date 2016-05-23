require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
   'hello world!'
  end

  get '/posts/:id/edit' do
    @id = params[:id]
    @post = Post.find(@id)
    erb :edit
  end

  delete '/posts/:id/delete' do
    @id = params[:id]
    name = Post.find(@id).name
    @post = Post.delete(@id)
    "#{name} was deleted."
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update(params[:post])
    erb :'posts/'+params[:id]
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post =  Post.find(params[:id])
    erb :show
  end

  post '/posts' do
    @new_post = Post.create(params[:post])
    @posts = Post.all
    erb :index
  end

end
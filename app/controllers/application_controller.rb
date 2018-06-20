
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

  post '/posts' do
    name = params["name"]
    content = params["content"]
    post = Post.create(name: name, content: content)

    redirect to '/posts'
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
    erb :edit
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id]).destroy
  end

  patch '/posts/:id/edit' do

    @post = Post.find(params[:id])
    new_name = params["name"]
    new_content = params["content"]

    @post.update(name: new_name, content: new_content)
    # redirect to "/posts/#{@post.id}"
    redirect to "/posts/#{@post.id}"
  end

  get '/posts/:id/delete' do
    @post = Post.find(params[:id])

  end

  post '/posts/:id/delete' do
    @post = Post.find(params[:id])

  end

end

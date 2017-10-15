require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Welcome to the Sinatra ActiveRecord CRUD lab!"
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    #post =
    Post.create(name: params[:name], content: params[:content])

    redirect to '/posts'
    #redirect to "/posts/#{post.id}"
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    Post.destroy(params[:id])

    erb :delete
  end

  patch '/posts/:id' do
    id = params[:id]
    name = params[:name]
    content = params[:content]
    post = Post.update(id, name: name, content: content)
    post.save


    redirect to "/posts/#{post.id}"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :show
  end
end

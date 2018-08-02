
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    'Hello World!'
    end

    get '/posts' do
      @posts = Post.all
      erb :'posts/index'
    end

    get '/posts/new' do
      erb :'posts/new'
    end

    get '/posts/:id' do
      @post = Post.find(params[:id])
      erb :'posts/show'
    end

    post '/posts' do
      Post.create(name: params[:name], content: params[:content])
      redirect to '/posts'
    end

    get '/posts/:id/edit' do
      @post = Post.find(params[:id])
      erb :'posts/edit'
    end

    patch '/posts/:id' do
      @post = Post.find(params[:id])
      @post.update(name: params[:name], content: params[:content])

      redirect to "/posts/#{@post.id}"
    end

    delete '/posts/:id/delete' do
      @post = Post.find(params[:id])
      @post_name = @post.name
      @post.destroy

      erb :'posts/delete'
    end

end

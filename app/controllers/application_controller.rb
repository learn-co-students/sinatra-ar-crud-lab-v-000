
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # create a post
  get '/posts/new' do
    erb :new
  end

  # create a post
  post '/posts' do
    @post = Post.create(params)
    # redirect to '/posts'
    erb :index
  end

  # read a post
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    id = params[:id]
    @post = Post.all.find_by_id(id)
    erb :show
  end

  # update a post
  get '/posts/:id/edit' do
    id = params[:id]
    @post = Post.all.find_by_id(id)
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    # binding.pry
    @post.update(content: params[@post.content], name: params[@post.name])
    erb :show
  end

    delete '/posts/:id/delete' do
      @post = Post.find_by_id(params[:id]).delete
      erb :delete
    end
  


end

require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @posts = Post.all
    @post = Post.create(name: params[:name], content: params[:content])
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
      @post2 = Post.find_by_id(params[:id])
    erb :edit
  end

  post '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :show
  end

  post '/posts/:id/delete' do
    @post3 = Post.find_by_id(params[:id]).delete
    erb :delete
  end

end

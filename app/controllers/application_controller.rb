require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    if Post.find_by_name(params[:name])
      @replica_post = true
    else
      new_post = Post.create(params)
    end
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do 
    erb :new
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
    @post = Post.find(params[:id])
    @post.update( {name: params[:name], content: params[:content]} )
    erb :show
  end

  delete '/posts/:id/delete' do
    Post.find(params[:id]).delete
    redirect '/posts'
  end

end
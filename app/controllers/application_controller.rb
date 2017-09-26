require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do 
    erb :'posts/new'
  end
    
  post '/posts' do


    @post = Post.create(params[:post])
    
    erb :'posts/index'
  end

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/:id' do
    @post_id = params[:id]
    @posts = Post.all
    @post = @posts.find(@post_id)
    erb :'posts/show'
  end

  get '/posts/:id/edit' do
    @post_id = params[:id]
    @post = Post.all.find(@post_id)

    erb :'posts/edit'
  end

  patch '/posts/:id' do 
    @post_id = params[:id]
    @posts = Post.all
    @post = @posts.find(@post_id)
    @post.update(params[:post])
    erb :'posts/show'

  end

  delete '/posts/:id/delete' do
    @post_name = Post.all.find(params[:id]).name
    Post.delete(params[:id])
    erb :'posts/deleted'
  end


end
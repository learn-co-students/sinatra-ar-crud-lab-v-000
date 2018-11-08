require_relative '../../../config/environment'

class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all 

    erb :'posts'
  end

  get '/new' do
    erb :'new'
  end

  post '/posts' do
    post = Post.create(params)
    
    redirect '/posts'
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
    # @post.name = params[:name]
    @post.update(name: params[:name])
    @post.update(content: params[:content])

    # @post.content = params[:content]
    # @post.save    
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    redirect '/posts'
  end


end
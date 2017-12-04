require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @all = Post.all
    erb :display
  end

  post '/posts' do
    @new_post = Post.create(name: params[:name], content: params[:content])
    @all = Post.all
    erb :display
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :display_one
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :update
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id]);
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :display_one
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    Post.delete(params[:id]);
    erb :delete
  end


end

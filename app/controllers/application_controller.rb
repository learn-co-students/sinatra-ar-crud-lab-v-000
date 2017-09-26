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
  @the_post = Post.create(name:params[:name], content:params[:content])
  redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @the_post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @the_post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @the_post = Post.find_by_id(params[:id])
    @the_post.name = params[:name]
    @the_post.content = params[:content]
    @the_post.save
    erb :show
  end

  delete '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id])
    @deleted_name = @post.name
    @post.delete
    erb :deleted
  end


end
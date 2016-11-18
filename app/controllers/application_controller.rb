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
    @post = Post.create(params)
    erb :index
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
    @post_edit = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post_edit = Post.find(params[:id])
    @post_edit.name = params[:name]
    @post_edit.content = params[:content]
    @post_edit.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post_delete = Post.find(params[:id])
    @post_delete.destroy
    erb :delete
  end
end

require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#CREATE
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    post = Post.create(params)
    redirect '/posts'
  end

#READ
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

#UPDATE
  get '/posts/:id/edit' do
    @post_to_update = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @updated_post = Post.find(params[:id])
    @updated_post.update(:name => params[:name], :content => params[:content])
    redirect to("/posts/#{params[:id]}")
  end

  #DELETE
  delete '/posts/:id/delete' do
    @post_to_delete = Post.find(params[:id])
    @post_to_delete.delete
    erb :delete
  end
end

require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    #use create to create blog post and save to db
    @new_post = Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
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
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    post_to_update = Post.find(params[:id])
    post_to_update.update({name: params[:name], content: params[:content]})
    redirect '/posts/' + params[:id]
  end

  delete '/posts/:id/delete' do
    @deleted_post = Post.find(params[:id])
    Post.delete(params[:id])
    erb :delete
  end


end

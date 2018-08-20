
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/posts'
  end

  get '/posts/new' do # CREATE
    erb :new
  end

  post '/posts' do # CREATE
    @post = Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

  get '/posts' do # READ
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do # READ
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do # UPDATE
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do # UPDATE
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do # DELETE
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :delete
  end
end

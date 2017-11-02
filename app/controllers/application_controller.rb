require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :'/new'
  end

  post '/posts' do
    #binding.pry
    post_data = params[:post]
    new_post = Post.create
    new_post.name = post_data["name"]
    new_post.content = post_data["content"]
    new_post.save

    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :'/index'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'/edit'
  end

  patch '/posts/:id' do

    update = params[:post]
    @post = Post.find(params[:id])

    @post.name = update["name"]
    @post.content = update["content"]
    @post.save
  #binding.pry
    redirect to("/posts/#{@post.id}")
  end

  delete '/posts/:id/delete' do
    "delete"
      @post = Post.find(params[:id])
      @post.destroy
      erb :'/delete'
  end

end
